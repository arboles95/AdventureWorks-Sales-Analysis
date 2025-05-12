# AdventureWorks Sales Dashboard Project

[![View this dashboard](https://img001.prntscr.com/file/img001/r9Mack7fTEqtUORI8RRf7g.png)](https://app.powerbi.com/view?r=eyJrIjoiY2YwMTIyZGQtMWE3ZS00ZjJiLWJjMTQtYzQ1ZDQ2MThhNzM2IiwidCI6ImIzY2ZkYTA0LTQ1YmEtNDI3Ni05YTdkLTQzNjM3YzA2OTUyNyIsImMiOjR9)

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

---

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
```

---

### 👥 DIM_Customers

```sql
-- Cleansed DIM_Customers Table --
SELECT 
  c.CustomerKey, 
  c.FirstName AS [First Name], 
  c.LastName AS [Last Name], 
  c.FirstName + ' ' + c.LastName AS [Full Name], 
  CASE c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,
  c.DateFirstPurchase, 
  g.City AS [Customer City]
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS c
  LEFT JOIN dbo.DimGeography AS g ON g.GeographyKey = c.GeographyKey 
ORDER BY 
  CustomerKey ASC
```
---

### 📦 DIM_Products

 ```sql
  -- Cleansed DIM_Products Table --
SELECT 
  p.ProductKey, 
  p.ProductAlternateKey AS ProductItemCode, 
  p.EnglishProductName AS [Product Name], 
  ps.EnglishProductSubcategoryName AS [Sub Category], 
  pc.EnglishProductCategoryName AS [Product Category]
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] AS p
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
  LEFT JOIN dbo.DimProductCategory AS pc ON pc.ProductCategoryKey = ps.ProductCategoryKey
 ```
---

## 📈 Dashboard Features

- **Interactive Visualizations:**  
  Dynamic charts and graphs that allow users to explore sales data interactively.

- **Filtering Capabilities:**  
  Ability to filter data by customer, product, and time period to gain specific insights.

- **KPI Tracking:**  
  Key Performance Indicators displayed to monitor sales performance against targets.

- **Budget Comparison:**  
  Visual comparisons between actual sales figures and budgeted targets.

---

## 🛠️ Tools & Technologies

- **Data Extraction & Transformation:** SQL  
- **Data Visualization:** Power BI  
- **Data Sources:** AdventureWorksDW2019 Database, Excel (for sales budgets)

