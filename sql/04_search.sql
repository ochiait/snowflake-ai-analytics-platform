-- 04_search.sql: Cortex Search setup for knowledge base
-- This file creates the knowledge table and search service for semantic search.
USE DATABASE AI_ANALYTICS_DB;

USE SCHEMA RETAIL;

CREATE OR REPLACE TABLE
  KNOWLEDGE_BASE (
    ID INTEGER AUTOINCREMENT PRIMARY KEY,
    CATEGORY VARCHAR (50), -- 'metric', 'business_rule', 'dimension'
    NAME VARCHAR (100),
    DESCRIPTION VARCHAR (1000),
    DEFINITION VARCHAR (2000),
    EXAMPLE VARCHAR (500),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

INSERT INTO
  KNOWLEDGE_BASE (CATEGORY, NAME, DESCRIPTION, DEFINITION, EXAMPLE)
VALUES
  (
    'metric',
    'Sales_Amount',
    'Revenue for a transaction line',
    'Calculated as Quantity * UnitPrice and represents the transaction sales amount.',
    'Quantity=2, UnitPrice=10.00 => Sales_Amount=20.00'
  ),
  (
    'metric',
    'OrderTotalValue',
    'Total order value',
    'Sum of Sales_Amount for all items in the same InvoiceNo.',
    'Invoice with 3 items totaling 150.00'
  ),
  (
    'metric',
    'AvgOrderValuePerCustomer',
    'Average order value per customer',
    'Average order value across all orders for a customer.',
    'Customer with 5 orders averaging 100.00'
  ),
  (
    'business_rule',
    'Return_Flag',
    'Return indicator for negative quantity',
    'A return is indicated when Quantity is negative. Return_Flag is true for returned items.',
    'Quantity=-1 sets Return_Flag=true'
  ),
  (
    'dimension',
    'Country',
    'Geographic dimension',
    'Country where the transaction occurred or where the customer is based.',
    'United Kingdom, France, Germany'
  ),
  (
    'dimension',
    'ProductDescription',
    'Product description field',
    'Description of the item sold in the transaction.',
    'WHITE HANGING HEART T-LIGHT HOLDER'
  );

CREATE
OR REPLACE CORTEX SEARCH SERVICE KNOWLEDGE_SEARCH_SERVICE ON DEFINITION ATTRIBUTES CATEGORY,
NAME,
DESCRIPTION WAREHOUSE = AI_ANALYTICS_WH TARGET_LAG = '1 day' AS (
  SELECT
    ID,
    CATEGORY,
    NAME,
    DESCRIPTION,
    DEFINITION,
    EXAMPLE,
    CREATED_AT
  FROM
    KNOWLEDGE_BASE
);

-- Comments:
-- Defines a knowledge base for metric and business rule search.
-- The Cortex Search service explicitly indexes the listed metadata columns.
-- Warehouse is set to AI_ANALYTICS_WH.