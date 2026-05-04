-- 03_semantic.sql: Semantic View for business metrics and dimensions
-- This file creates semantic views that define business meaning clearly

USE DATABASE SNOWFLAKE_AI_ANALYTICS;
USE SCHEMA RETAIL_SCHEMA;

-- Semantic View: Business metrics and dimensions
CREATE OR REPLACE VIEW SEMANTIC_VIEW AS
SELECT
    -- Dimensions
    dm.InvoiceNo AS OrderID,
    dm.StockCode AS ProductCode,
    dm.ProductDescription,
    dm.CustomerID,
    dm.Country,
    dm.InvoiceDate,
    YEAR(dm.InvoiceDate) AS OrderYear,
    MONTH(dm.InvoiceDate) AS OrderMonth,
    DAY(dm.InvoiceDate) AS OrderDay,

    -- Metrics
    dm.Quantity,
    dm.UnitPrice,
    dm.SalesAmount,
    CASE WHEN dm.Quantity > 0 THEN dm.SalesAmount ELSE 0 END AS PositiveSalesAmount,
    CASE WHEN dm.Quantity < 0 THEN ABS(dm.SalesAmount) ELSE 0 END AS ReturnAmount,

    -- Calculated metrics
    SUM(dm.SalesAmount) OVER (PARTITION BY dm.InvoiceNo) AS OrderTotalValue,
    AVG(dm.SalesAmount) OVER (PARTITION BY dm.CustomerID) AS AvgOrderValuePerCustomer,
    COUNT(dm.InvoiceNo) OVER (PARTITION BY dm.CustomerID) AS TotalOrdersPerCustomer

FROM DATA_MART dm;

-- Comments:
-- Defines business meaning clearly.
-- Includes metrics: total sales, order count, average order value.
-- Includes dimensions: customer, country, product category (via description).