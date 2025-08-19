# Customer-Segmentation-for-Personalized-Rewards-using-Machine-Learning

# 📌 Project Title

Customer Segmentation for Personalized Rewards – TravelTide

⸻

# 🎯 Goal

The goal of this project is to analyze customer behavior and segment TravelTide’s user base in order to identify which perks (e.g., free cancellation, discounts, upgrades) individual customers are most likely to value. These insights will be used to design a personalized rewards program that maximizes engagement and retention.

⸻

# 🏢 Business Context

TravelTide is a fast-growing e-booking startup that has built a competitive advantage by offering the largest travel inventory in the industry. However, the company faces challenges in customer retention.

To address this, Elena Tarrant (Head of Marketing) is leading a personalized rewards program. The hypothesis is that different customers value different perks, and by emphasizing the right perk for each customer, TravelTide can significantly increase sign-ups for the rewards program and strengthen long-term loyalty.

As part of the Analytics team, our task is to:

	1.	Validate whether distinct customer segments exist based on preferences for perks.
	2.	Assign each customer a likely favorite perk to personalize marketing campaigns.

⸻

# 🌍 Real-World Impact

•	Personalized Marketing → Customers receive reward invitations highlighting perks most relevant to them, improving engagement.

•	Higher Retention → A tailored rewards program builds loyalty and keeps customers returning to the TravelTide platform.

•	Revenue Growth → Increased retention leads to repeat bookings, lower churn, and stronger lifetime customer value (LTV).

•	Scalable Strategy → The segmentation framework can be extended to new perks, destinations, or campaigns, making TravelTide’s marketing efforts more data-driven and effective.

⸻

**⚡ This project bridges** Marketing expertise and Data Analytics, showing how data-driven segmentation directly supports business growth.


# Project Workflow


## 🗄️ Phase 1 - Data Source & Preparation

	1.	Storage: TravelTide stores its data in a PostgreSQL relational database.
	2.	Extraction: SQL queries were written to filter, aggregate, and join relevant tables.
	3.	Export: The cleaned datasets were downloaded as CSV files for further analysis.
	4.	Analysis & Modeling: Machine Learning algorithms (clustering) were applied to uncover customer segments and preferences.

**🔹 All SQL queries** used for data extraction are stored in the sql_query folder for reproducibility.

**🔹 All CSV data** available in this Google Drive link: https://drive.google.com/drive/folders/1fqbSK29ldlKn-MS2XVVa-uXrZWfAAiGy?usp=sharing
	 
**🔹 Connect to the TravelTide database**

	 postgres://Test:bQNxVzJL4g6u@ep-noisy-flower-846766.us-east-2.aws.neon.tech/TravelTide

**🔹 Customers Filtering**

1. activity starting after 04.01.2023 and more than 7 sessions (using SQL).
2. One million user/5 million unique app sessions/after filtering 5782 active users

## 🔍 Phase 2 – Exploratory Data Analysis (EDA)

In the EDA Colab notebook, I analyzed multiple CSV datasets including:

	•	Users Data → demographic details (age, marital status, children, home country, tenure).
	•	Hotels Info → hotel bookings, nights, average price, distinct hotels booked.
	•	Flights Data → seats booked, flight price, number of flights, distance flown, checked bags.
	•	Sessions Data → trips count, session count, session duration, page clicks, canceled trips.

**Key Insights from EDA**

	•	75.10% of users booked both hotel and flight during trip planning.
	•	24.89% booked either a hotel or a flight.
	•	Recommendation: Target customers with personalized perks to encourage combined bookings (hotel + flight).

**Why Perks matters:**

	•	Personalized perks can boost loyalty and engagement.
	•	Higher retention improves lifetime customer value (LTV).
	•	Smarter targeting increases return on marketing investment (ROI).

⸻

## 🛠️ Phase 3 – Feature Engineering

In the feature engineering notebook, I engineered a user-level feature dataset by combining user, hotel, flight, and session information. There are 21 user-based
features from user demographic info.,session behavior and purchase patterns from hotel and flight bookings.
Analyzing tool: Python

**Feature Overview**

	•	21 User-based features (raw and engineered).
	•	16 newly engineered features created through aggregation and transformation.
	•	Final dataset → one feature row per user.

**Example of Features**

	•	Demographics: Age, marital status, children, home country, tenure (months).
	•	Flights: Seats booked, avg. flight price, number of flights, distance flown, and checked bags.
	•	Hotels: Rooms booked, night stays, avg. hotel price, distinct hotels booked.
	•	Sessions: Number of trips, session count, session duration, page clicks per session, and canceled trips.

 ## 🔍 Phase 4 – Clustering & Analysis

**Steps performed:**

	1 Importing Libraries – pandas, matplotlib, seaborn, sklearn, etc.
 
	2.	Load Data – joined dataset with all engineered features.
 
	3.	EDA on Features – distributions, correlations, scaling needs.
 
	4.	Preprocessing – outlier detection, encoding, scaling, standardization, missing value treatment, and PCA (10 components explain 80% variance) component analysis.
 
	5.	K-Means Clustering
 
	•	Elbow method + silhouette score to select optimal clusters.
	•	Cluster interpretation (user segments by booking & behavior).
 
	6.	Evaluation
 
	•	Silhouette Score, Davies-Bouldin Index, CH Index.
	•	Business meaning of each cluster.
 
	7.	Alternative Method: DBSCAN
 
	•	Tested density-based clustering for irregular clusters.
	•	Less effective due to sparse/noisy data → K-Means chosen.
 
	8.	Final Recommendation
 
	•	K-Means is the most suitable algorithm for this case.
	•	Produces well-separated, interpretable clusters.
 
	9.	Final Dataset
 
	•	All users labeled with their cluster assignment.
	•	Ready for the marketing team to design targeted perk campaigns.
 

## 🔑 Key Insights from Segmentation

- **7 unique customer segments** were identified based on behavioral patterns, demographics, and engagement history. Four segments are derived from k-means ML, and three segments are generated using the EDA approach.  
- Segments include:

| Segment | Share of Users | Key Traits | Preferred Reward |
|---------|----------------|------------|------------------|
| 👑 **Elite** | 20.7% | VIPs, high-spending, premium class | All perks valuable |
| 💼 **Business Travelers** | 24.6% | Frequent short trips, value-conscious, book flight + hotel | No cancellation fees |
| 👨‍👩‍👧 **Family Travelers** | 10.1% | Group bookings, seasonal activity, mid-high hotel & flight counts | Free checked bag |
| 👴 **Senior Travelers** | 9.5% | Less frequent but high-value trips | Free hotel meal |
| 💸 **Casual Deal Seekers** | 27.1% | Price-sensitive, last-minute bookings | Exclusive discounts |
| 🔁 **Cautious Loyalists** | 6.6% | Repeat customers, low complaints | No cancellation fees |
| 🏝️ **Memory Makers** | 1.4% | Long stays, travel with companions | 1 night free hotel with flight |


📌 **Why it matters:**  

- Different customer types require **personalized rewards**.  
- Example: *Business Travelers* prefer “no cancellation fees,” while *Family Travelers* value “free checked bags.”

---

## 📊 Model Results

### ⚡ K-Means Clustering
- Produced **4 meaningful clusters** that are interpretable and actionable.  
- **Metrics:**
  - Silhouette Score = `0.148`  
  - Davies-Bouldin Index = `1.95`  
  - Calinski-Harabasz Index = `576`

### 🌀 DBSCAN (Alternative)
- Higher Silhouette Score (`0.287`) but collapsed data into **1 cluster + noise** → not useful for marketing.  

✅ **Winner: K-Means**  
- High interpretability  
- Clear cluster separation  
- Usable for **multi-segment marketing strategies**

---

## 💡 Recommendations

- 📧 **Segment-based email campaigns** → emphasize the perk most relevant to each cluster.  
- 🎲 **A/B testing of rewards** → validate hypotheses and optimize campaigns.  
- 🔄 **Quarterly refinement of clusters** → refresh as customer behavior evolves.  

---

## 🏁 Conclusion
- **Customer segmentation via K-Means clustering** revealed clear groups with distinct travel behaviors and preferences.  
- **Key outcome:** Reward strategies can now be tailored:  
  - 🍽️ Free hotel meals → *Senior Travelers*  
  - 🧳 Free checked bags → *Family Travelers*  
  - 🚫 No cancellation fees → *Business Travelers & Loyalists*  
  - 💸 Discounts → *Casual Deal Seekers*  
  - 👑 VIP perks → *Elite Customers*
  - 🧳 One night free hotel with a flight → *Memory Makers*
 
# 🛠️ Tech Stack
	•	Languages: Python (Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn)
	•	Database: PostgreSQL (for initial data extraction)
	•	Environment: Google Colab
	•	ML Algorithms: K-Means, DBSCAN

🎯 This supports **higher loyalty, better retention, and stronger ROI** for TravelTide’s rewards program.  


