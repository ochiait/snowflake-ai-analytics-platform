-- 02_mart.sql: Data Mart creation for analytical views
-- This file creates the core tables and analytical views for the UCI Online Retail Dataset

USE DATABASE SNOWFLAKE_AI_ANALYTICS;
USE SCHEMA RETAIL_SCHEMA;

-- Create raw tables based on UCI Online Retail Dataset

-- Transactions table
CREATE OR REPLACE TABLE TRANSACTIONS (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);

-- Customers table (derived from transactions)
CREATE OR REPLACE TABLE CUSTOMERS (
    CustomerID VARCHAR(20) PRIMARY KEY,
    Country VARCHAR(50)
);

-- Products table (derived from transactions)
CREATE OR REPLACE TABLE PRODUCTS (
    StockCode VARCHAR(20) PRIMARY KEY,
    Description VARCHAR(255)
);

-- Countries table (derived from transactions)
CREATE OR REPLACE TABLE COUNTRIES (
    Country VARCHAR(50) PRIMARY KEY
);

-- Data Mart View: Analytical view joining all tables with calculated sales_amount
CREATE OR REPLACE VIEW DATA_MART AS
SELECT
    t.InvoiceNo,
    t.StockCode,
    p.Description AS ProductDescription,
    t.Quantity,
    t.InvoiceDate,
    t.UnitPrice,
    t.Quantity * t.UnitPrice AS SalesAmount,
    t.CustomerID,
    c.Country,
    co.Country AS CountryName  -- Join with countries table
FROM TRANSACTIONS t
LEFT JOIN PRODUCTS p ON t.StockCode = p.StockCode
LEFT JOIN CUSTOMERS c ON t.CustomerID = c.CustomerID
LEFT JOIN COUNTRIES co ON t.Country = co.Country;

-- Comments:
-- This creates the analytical Data Mart view that AI can query directly.
-- Includes calculated sales_amount field.
-- Joins transaction, customer, product, and country data.