-- 03_semantic.sql: Semantic View template for Snowflake
-- This file provides a Snowflake Semantic View template and explanatory notes.

USE DATABASE AI_ANALYTICS_DB;
USE SCHEMA RETAIL;

-- Note: Snowflake Semantic Views have a specialized syntax. The following is a template
-- and may require adjustment for your Snowflake account and semantic model definitions.

-- CREATE OR REPLACE SEMANTIC VIEW SEMANTIC_RETAIL_VIEW AS
-- SELECT
--     InvoiceNo AS OrderID,
--     StockCode AS ProductCode,
--     Description AS ProductDescription,
--     CustomerID,
--     Country,
--     InvoiceDate,
--     Quantity,
--     UnitPrice,
--     Quantity * UnitPrice AS Sales_Amount,
--     CASE WHEN Quantity < 0 THEN TRUE ELSE FALSE END AS Return_Flag,
--     SUM(Quantity * UnitPrice) OVER (PARTITION BY InvoiceNo) AS OrderTotalValue,
--     AVG(Quantity * UnitPrice) OVER (PARTITION BY CustomerID) AS AvgOrderValuePerCustomer,
--     COUNT(DISTINCT InvoiceNo) OVER (PARTITION BY CustomerID) AS TotalOrdersPerCustomer
-- FROM V_RETAIL_ANALYSIS;

-- Comments:
-- This file is intentionally left as a semantic view template.
-- It avoids creating a normal view named SEMANTIC_VIEW.
-- Adjust the syntax and object names based on Snowflake Semantic View support in your environment.