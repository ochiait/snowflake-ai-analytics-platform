-- 04_search.sql: Cortex Search setup for knowledge base
-- This file creates the knowledge table and search service

USE DATABASE SNOWFLAKE_AI_ANALYTICS;
USE SCHEMA RETAIL_SCHEMA;

-- Knowledge table for metric definitions and business rules
CREATE OR REPLACE TABLE KNOWLEDGE_BASE (
    ID INTEGER AUTOINCREMENT PRIMARY KEY,
    CATEGORY VARCHAR(50),  -- 'metric', 'business_rule', 'dimension'
    NAME VARCHAR(100),
    DESCRIPTION VARCHAR(1000),
    DEFINITION VARCHAR(2000),
    EXAMPLE VARCHAR(500),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample knowledge entries
INSERT INTO KNOWLEDGE_BASE (CATEGORY, NAME, DESCRIPTION, DEFINITION, EXAMPLE) VALUES
('metric', 'SalesAmount', 'Total sales amount for a transaction', 'Calculated as Quantity * UnitPrice. Represents revenue from sales.', 'If Quantity=2, UnitPrice=10.00, SalesAmount=20.00'),
('metric', 'OrderTotalValue', 'Total value of an order', 'Sum of SalesAmount for all items in an invoice.', 'Invoice with 3 items totaling 150.00'),
('metric', 'AvgOrderValuePerCustomer', 'Average order value per customer', 'Average of OrderTotalValue across all orders for a customer.', 'Customer with 5 orders averaging 100.00 each'),
('business_rule', 'Returns', 'Handling of negative quantities', 'Negative quantities indicate returns or cancellations. SalesAmount is negative for returns.', 'Quantity=-1 means a return'),
('dimension', 'Country', 'Geographic dimension', 'Country where the customer is located or transaction occurred.', 'United Kingdom, France, etc.'),
('dimension', 'ProductDescription', 'Product information', 'Description of the product being sold.', 'WHITE HANGING HEART T-LIGHT HOLDER');

-- Create Cortex Search service on the knowledge table
CREATE OR REPLACE CORTEX SEARCH SERVICE KNOWLEDGE_SEARCH_SERVICE
ON KNOWLEDGE_BASE
ATTRIBUTES CATEGORY, NAME
WAREHOUSE = COMPUTE_WH  -- Replace with your warehouse name
TARGET_LAG = '1 day';

-- Comments:
-- Creates knowledge table for definitions.
-- Includes metric definitions and business rules.
-- Builds search service for RAG functionality.