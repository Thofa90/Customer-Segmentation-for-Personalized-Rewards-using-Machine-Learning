-- Final query to download as csv 1 big file
-- This query returns the ids of all users with more than 7 sessions in 2023

-- Session after January 04,2023
WITH sessions_2023 AS (
  SELECT *
  FROM sessions s
  where s.session_start >= '2023-01-05' -- 
),
-- This CTE returns the ids of all users with more than 7 sessions in 2023
filtered_users AS (
  SELECT user_id, COUNT(*) FROM sessions_2023 s
  GROUP BY user_id
  HAVING COUNT(*) > 7 -- 5782 user id
),
-- keep in mind mind that these joins are there for the ones that want to work with one big table, from here you can see
-- how to join the columns for the finished filtered table, if you want to do the approach using the indivudal tables
-- (like I am doing in the live session, you can just substitute the last select statement with the selects statements
-- that are commented out below)
session_base AS
(select s.session_id, s.user_id, s.trip_id, s.session_start, s.session_end, s.page_clicks,
 s.flight_discount, s.flight_discount_amount, s.hotel_discount, s.hotel_discount_amount, s.flight_booked, s.hotel_booked, s.cancellation,
 u.birthdate, u.gender, u.married, u.has_children, u.home_country, u.home_city, u.home_airport, u.home_airport_lat, u.home_airport_lon,u.sign_up_date,
 f.origin_airport, f.destination, f.destination_airport, f.seats, f.return_flight_booked, f.departure_time, f.return_time, f.checked_bags, f.trip_airline, f.destination_airport_lat, f.destination_airport_lon,f.base_fare_usd,
 h.hotel_name, h.nights, h.rooms, h.check_in_time, h.check_out_time, h.hotel_per_room_usd
from sessions_2023 s
left join users u
on s.user_id = u.user_id
left join flights f
on s.trip_id = f.trip_id
left join hotels h
on s.trip_id = h.trip_id
WHERE s.user_id IN (SELECT user_id FROM filtered_users))

-- if using on big table use this
SELECT *
FROM session_base; --47436

-- if using individual tables use this one by one and downlaod the csv
 /*
SELECT *
FROM flights where flights.trip_id in (select trip_id from session_base);
SELECT *
FROM hotels where hotels.trip_id in (select trip_id from session_base);
SELECT *
FROM sessions where sessions.session_id in (select session_base.session_id from session_base);
SELECT *
FROM users where users.user_id in (select session_base.user_id from session_base);
  */