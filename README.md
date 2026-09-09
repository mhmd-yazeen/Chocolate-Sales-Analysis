# 🍫 Chocolate Sales Analysis SQL Project

A structured SQL analysis of a chocolate retail business using Microsoft SQL Server Management Studio (SSMS), covering sales performance, product insights, customer behaviour, and store-level revenue.
mmmm
---

## 📋 Table of Contents
1. [Project Overview](#project-overview)
2. [Tools & Technologies](#tools--technologies)
3. [Database Setup](#database-setup)
4. [Dataset Description](#dataset-description)
5. [Business Questions Summary](#business-questions-summary)
6. [Key Insights & Findings](#key-insights--findings)
7. [Business Recommendations](#business-recommendations)
8. [Skills Demonstrated](#skills-demonstrated)
9. [Project Structure](#project-structure)
10. [Author](#author)

---

## Project Overview
This project simulates a real-world business intelligence scenario for a chocolate retail company. Across **20 analytical questions (Q1–Q20)** divided into exploratory and multi-table queries, it uncovers actionable insights on revenue, profit, customer demographics, and store channels.

## Tools & Technologies
* **Database Management:** Microsoft SQL Server Management Studio (SSMS)
* **Query Language:** T-SQL
* **Data Source:** CSV Files (5 relational tables)
* **Version Control:** GitHub

## Database Setup
* Created a new database named `ChocolateSales`.
* Imported 5 CSV files (`sales`, `products`, `customers`, `stores`, and `calendar`) using the SSMS Import Wizard.

## Dataset Description
* **sales:** 1,000,000 transaction records (revenue, profit, quantity, discount).
* **products:** Product catalog (brand, category, cocoa percentage).
* **customers:** Customer records (gender, loyalty status).
* **stores:** Store locations and types (airport, mall, online, retail).
* **calendar:** Date dimension table for time-based tracking.

---

## Key Insights & Findings
1. **Strong Financial Health:** $25.5M revenue with a robust ~40% overall profit margin ($10.2M profit).
2. **Channel Dominance:** Airport stores vastly outperform standard Retail stores due to impulse/gifting behaviour.
3. **Market Concentration:** Canada is the core revenue engine, led heavily by Toronto.
4. **Underperforming Loyalty Lift:** The current loyalty program retains spend rather than driving incremental growth.
5. **Gender-Neutral Spending:** Purchasing power and average order values show zero variance between genders.

---

## Business Recommendations
1. **Scale Airport & Transit Retail:** Expand airport footprints and introduce travel-exclusive product bundles.
2. **Revamp Loyalty Program:** Restructure into tier-based rewards to incentivize incremental spending.
3. **Optimize Discounting:** Reduce blanket discounts (currently applied to 37.5% of orders) to safeguard margins.
4. **Focus on Top Categories:** Prioritize inventory allocation for high-volume lines like Praline and mid-cocoa bars.
5. **Localized Growth:** Increase targeted marketing and store presence in top-performing regions like Canada.

---

## Skills Demonstrated
* Database creation & flat-file data ingestion in SSMS.
* Advanced querying using relational joins, groupings, and conditional logic.
* Use of aggregate functions and relative benchmarking via subqueries.

---
