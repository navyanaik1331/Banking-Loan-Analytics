# 🏦 Banking & Loan Analytics

## 📌 Project Overview

An end-to-end **Banking & Loan Analytics** project built to analyze loan applications, approval patterns, applicant financial profiles, credit scores, loan amounts, and other factors that may be associated with loan approval outcomes.

The project follows a complete Data Analyst workflow using **Excel → MySQL → Power BI → Business Insights**.

> **Note:** This is an educational/portfolio project based on a public loan approval dataset and does not represent real bank customer or lending decisions.

---

## 🎯 Business Objectives

The main objectives of this project are to:

* Analyze the overall volume of loan applications.
* Compare approved and rejected applications.
* Calculate loan approval and rejection rates.
* Analyze approval patterns across CIBIL categories.
* Compare approval patterns by education and employment status.
* Analyze applicant income and loan amounts.
* Examine loan-to-income ratios and asset values.
* Identify patterns in loan approval outcomes.
* Build an interactive Power BI dashboard for business analysis.
* Generate actionable business insights from the data.

---

## 🛠️ Tools & Technologies

| Tool                | Purpose                                                     |
| ------------------- | ----------------------------------------------------------- |
| **Microsoft Excel** | Data cleaning, validation, analysis, PivotTables and charts |
| **MySQL**           | SQL-based data analysis and business queries                |
| **Power BI**        | Interactive dashboard and data visualization                |
| **GitHub**          | Project documentation and portfolio                         |

### SQL Concepts Used

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* CASE
* Aggregate Functions
* HAVING
* Subqueries
* JOINs
* CTEs
* Window Functions
* Views
* Stored Procedures
* Ranking
* LAG / LEAD

---

## 📊 Dataset

The dataset contains **4,269 loan applications** with information about:

* Loan ID
* Number of dependents
* Education
* Self-employment status
* Annual income
* Loan amount
* Loan term
* CIBIL score
* Residential assets
* Commercial assets
* Luxury assets
* Bank assets
* Loan status

### Data Quality

During Excel data preparation:

* Missing values: **0**
* Duplicate records: **0**
* Duplicate Loan IDs: **0**
* Invalid CIBIL scores: **0**
* Negative income values: **0**
* Negative loan amounts: **0**
* Invalid negative asset values were identified and handled during cleaning.

---

## 🔄 Project Workflow

```text
Raw Dataset
     ↓
Excel Data Cleaning & Validation
     ↓
Excel Analysis & PivotTables
     ↓
Business Insights
     ↓
MySQL Data Analysis
     ↓
Advanced SQL Queries
     ↓
Power BI Dashboard
     ↓
Final Business Insights
```

---

## 📗 Excel Analysis

Excel was used for the initial data preparation and exploratory analysis.

### Key Activities

* Data cleaning
* Data validation
* Missing-value checks
* Duplicate checks
* Categorical value cleaning
* Derived analytical columns
* PivotTable analysis
* KPI calculations
* Charts and visual analysis

### Derived Columns

* Income Group
* CIBIL Category
* Loan-to-Income Ratio
* Total Assets

---

## 🗄️ MySQL Analysis

The cleaned dataset was imported into MySQL for deeper analysis.

A total of **38 SQL queries** were developed covering:

### Basic KPI Analysis

* Total loan applications
* Approved applications
* Rejected applications
* Approval rate
* Rejection rate
* Average loan amount
* Average income
* Average CIBIL score

### Advanced Analysis

* GROUP BY and CASE analysis
* HAVING conditions
* Subqueries
* JOIN-based analysis
* Common Table Expressions (CTEs)
* Window functions
* Ranking
* LAG analysis
* SQL Views
* Stored Procedures

The complete SQL analysis is available in:

**`Banking_Loan_Analytics.sql`**

---

## 📊 Power BI Dashboard

A **3-page interactive Power BI dashboard** was developed using the cleaned dataset.

### Page 1 — Executive Overview

Focuses on:

* Total Applications
* Approved Applications
* Rejected Applications
* Approval Rate
* Average CIBIL Score
* Total Loan Amount
* Loan Application Status
* Approval Rate by CIBIL Category
* Approval Rate by Income Group
* Average Loan Amount by Loan Status

### Page 2 — Approval Analysis

Focuses on:

* Loan applications by CIBIL category
* Approval rate by income group
* Approval by education
* Approval by employment status
* Applications by number of dependents
* Applications by loan term

### Page 3 — Financial & Risk Analysis

Focuses on:

* Average loan amount by income group
* Average loan amount by CIBIL category
* Average loan-to-income ratio
* Average total assets
* Income vs Loan Amount analysis

---

## 📈 Key Business Insights

### Overall Performance

* Total loan applications: **4,269**
* Approved applications: **2,656**
* Rejected applications: **1,613**
* Overall approval rate: **62.22%**
* Overall rejection rate: **37.78%**

### Credit Profile

Loan approval shows a **strong association with CIBIL category** in this dataset.

* Poor CIBIL: **10.36% approval**
* Fair CIBIL: **99.71% approval**
* Good CIBIL: **99.33% approval**
* Excellent CIBIL: **99.43% approval**

### Education

Approval rates were very similar:

* Graduate: **62.45%**
* Not Graduate: **61.98%**

### Employment

Self-employed and non-self-employed applicants also showed nearly identical approval rates:

* Self-employed: **62.23%**
* Non-self-employed: **62.20%**

### Loan Amount

* Total loan amount requested: **₹64.60 billion**
* Average loan amount: **₹15.13 million**
* Average approved loan amount: **₹15.25 million**
* Average rejected loan amount: **₹14.95 million**

> These observations describe patterns in the dataset and should not be interpreted as causal relationships or real-world lending policies.

---

## 📁 Repository Structure

```text
Banking-Loan-Analytics/
│
├── Banking_Loan_Analytics.xlsx
│
├── Banking_Loan_Analytics.sql
│
└── README.md
```

---

## 💡 Key Learning Outcomes

Through this project, I practiced:

* Real-world data cleaning
* Exploratory data analysis
* Excel-based business analysis
* Advanced SQL querying
* CTEs and window functions
* Views and stored procedures
* KPI development
* Power BI dashboard development
* Business insight generation
* Data storytelling

---

## 👩‍💻 Author

Navyashree Naik

Aspiring Data Analyst | SQL | Power BI | Excel | Python

This project was created as part of my Data Analytics learning and portfolio development.
