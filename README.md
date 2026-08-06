# 📊 shopnow-sales-performance-dashboard-powerbi

## About ShopNow
ShopNow is a fictional multinational retail company created for this portfolio project. The company sells a wide range of products across multiple countries through an online retail platform. This dashboard helps executives monitor sales performance, customer behavior, and product profitability using interactive analytics built with MySQL and Power BI.
This project analyzes retail sales performance using MySQL and Power BI.  The objective is to understand business performance across products, countries and customers through interactive dashboards. The project covers complete ETL, data cleaning, data modeling and visualization.

## 📌 Project Overview

This project presents an end-to-end Retail Sales Analytics solution developed using **MySQL** and **Power BI**. The objective is to transform raw transactional data into meaningful business insights through data cleaning, modeling, DAX calculations, and interactive dashboards.

The dashboard enables business users and executives to monitor sales performance, analyze customer behavior, evaluate product profitability, and compare country-wise performance.

---

## 🚀 Project Workflow

Raw Dataset
        ↓
Data Cleaning (MySQL)
        ↓
Data Validation
        ↓
Data Modeling
        ↓
Power BI Dashboard
        ↓
Business Insights

---

## 🛠 Tools & Technologies

- MySQL
- Power BI
- Power Query
- DAX
- Git
- GitHub

---

# Dataset

The project uses the **Maven Analytics Data Playground** Retail dataset.

### Tables

| Table | Description |
|--------|-------------|
| Sales | Transactional sales records |
| Customers | Customer demographic information |
| Products | Product information |
| Stores | Store information |
| Exchange Rates | Currency exchange information |

---

# Data Cleaning (MySQL)

The dataset was cleaned before importing into Power BI.

Cleaning activities included:

- Removing leading/trailing whitespaces
- Replacing empty strings with NULL values
- Converting text dates into DATE datatype
- Removing currency symbols ($) and commas
- Converting currency columns into DECIMAL datatype
- Creating reusable dynamic Stored Procedures
- Performing validation checks
- Handling missing CustomerKeys and StoreKeys
- Maintaining data consistency before visualization

---

# Data Modeling

A Star Schema was implemented in Power BI.

Fact Table

- Sales

Dimension Tables

- Customers
- Products
- Stores
- Calendar
- Exchange Rates

Single-direction relationships were used to maintain an optimized data model.

---

# Dashboard Pages

## Executive Overview

Features

- Total Revenue
- Total Profit
- Total Cost
- Total Orders
- Total Customers
- Average Order Value
- Average Delivery Days
- Revenue Trend
- Profit Trend
- Brand Performance
- Country Performance

---

## Country Performance

Features

- Revenue by Country
- Profit by Country
- Revenue by State
- Top Products by Country
- Country KPIs
- Drill-through from Executive Dashboard

---

## Product Performance

Features

- Revenue by Brand
- Category Analysis
- Top 15 Products
- Bottom 15 Products
- Profit Margin Analysis
- Dynamic Navigation

---

## Customer Analysis

Features

- Customer Demographics
- Gender Distribution
- Average Male Age
- Average Female Age
- Revenue by Age Group
- Profit by Age Group
- Unknown Customer Percentage
- Category-wise Customer Analysis

---

# Key DAX Measures

Some important DAX measures used include:

- Total Revenue
- Total Profit
- Total Cost
- Profit %
- Average Order Value
- Average Delivery Days
- Profit Margin
- Revenue per Customer
- Top N Products
- Bottom N Products
- TREATAS() based Customer Analysis

---

# Challenges Solved

During development several real-world data issues were encountered and resolved.

Examples include:

- Text dates
- Currency stored as text
- Missing CustomerKeys
- Missing StoreKeys
- Data type inconsistencies
- Dynamic SQL Stored Procedures
- Filter context issues solved using TREATAS()
- Drill-through reset behavior
- Dynamic navigation

---

# Business Insights

Some insights generated from the dashboard include:

- United States generated the highest revenue.
- Adventure Works is the highest performing brand.
- Customer age groups contribute differently to revenue and profitability.
- Approximately 26% of customer records contain missing demographic information due to unmatched CustomerKeys.
- Product profitability varies significantly across categories.

---

# Future Enhancements

Possible future improvements include:

- Row Level Security (RLS)
- Incremental Refresh
- Azure SQL integration
- Microsoft Fabric integration
- Customer Segmentation
- Sales Forecasting

---

# Dashboard Preview

(Add screenshots here)

Executive Dashboard

Country Dashboard

Product Dashboard

Customer Dashboard

---

# Repository Structure

```
Sales-Performance-Dashboard/
│
├── Dataset/
├── SQL/
├── PowerBI/
├── Images/
├── Documentation/
└── README.md
```

---

# Author

Sammed Sheri

GitHub:
LinkedIn: https://linkedin.com/in/sammed-sheri-92094123b
