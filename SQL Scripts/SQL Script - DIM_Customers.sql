-- Cleansed DIM_Customers Table --
SELECT 
  c.CustomerKey AS CustomerKey, 
  --[GeographyKey], 
  --[CustomerAlternateKey], 
  --[Title], 
  c.firstname AS [FirstName], 
  --[MiddleName], 
  c.lastname AS [LastName], 
  c.firstname + ' ' + lastname AS [Full Name], -- Combined First and Last Name
  --[NameStyle], 
  --[BirthDate], 
  --[MaritalStatus], 
  --[Suffix], 
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender, 
  --[EmailAddress], 
  --[YearlyIncome], 
  --[TotalChildren], 
  --[NumberChildrenAtHome], 
  --[EnglishEducation], 
  --[SpanishEducation], 
  --[FrenchEducation], 
  --[EnglishOccupation], 
  --[SpanishOccupation], 
  --[FrenchOccupation], 
  --[HouseOwnerFlag], 
  --[NumberCarsOwned], 
  --[AddressLine1], 
  --[AddressLine2], 
  --[Phone], 
  c.datefirstpurchase AS DateFirstPurchase, 
  --[CommuteDistance]
  g.city AS [Customer City] -- Joined in Customer City from Geography Table
FROM 
  [AdventureWorksDW2022].[dbo].[DimCustomer] AS c
  LEFT JOIN [AdventureWorksDW2022].[dbo].[DimGeography] AS g ON g.GeographyKey = c.GeographyKey
  ORDER BY
	CustomerKey ASC -- Ordered List by Customer Key
