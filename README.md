# AdventureWorks Sales Dashboard Project

**Project Overview:**  
This project entails the development of an executive sales report tailored for sales managers. The primary objective is to provide insightful dashboards that facilitate data-driven decision-making.

---

## 🧑‍💼 Business Request & User Stories

The business requirement was to create an executive sales report for sales managers. Based on this, the following user stories were defined to ensure that the deliverables met the acceptance criteria:

| Role              | Request                                             | User Value                                             | Acceptance Criteria                                                                 |
|-------------------|-----------------------------------------------------|--------------------------------------------------------|-------------------------------------------------------------------------------------|
| Sales Manager     | Dashboard overview of internet sales                | Identify top-performing customers and products         | Power BI dashboard with daily data updates                                          |
| Sales Representative | Detailed overview of internet sales per customer | Monitor and strategize for high-value customers        | Power BI dashboard with customer-level filtering                                    |
| Sales Representative | Detailed overview of internet sales per product  | Track and promote best-selling products                | Power BI dashboard with product-level filtering                                     |
| Sales Manager     | Dashboard overview of internet sales vs. budget     | Analyze sales trends against budgetary goals           | Power BI dashboard featuring graphs and KPIs comparing actual sales to budget       |

---

## 🧹 Data Cleansing & Transformation (SQL)

To construct the data model necessary for analysis and to meet the business needs outlined in the user stories, the following tables were extracted and transformed using SQL. Additionally, a sales budget data source provided in Excel format was integrated into the data model.

### 📅 DIM_Calendar

```sql
-- Cleansed DIM_Date Table --
SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date, 
  [EnglishDayNameOfWeek] AS Day, 
  [EnglishMonthName] AS Month, 
  LEFT([EnglishMonthName], 3) AS MonthShort, 
  [MonthNumberOfYear] AS MonthNo, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate]
WHERE 
  CalendarYear >= 2019
