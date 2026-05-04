-- 02_mart.sql: Data Mart creation for analytical views
-- This file creates the raw retail table and a cleaned analytical view.

USE DATABASE AI_ANALYTICS_DB;
USE SCHEMA RETAIL;

-- Create raw table for the UCI Online Retail Dataset
CREATE OR REPLACE TABLE RAW_ONLINE_RETAIL (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);

-- Analytical view for retail analysis
CREATE OR REPLACE VIEW V_RETAIL_ANALYSIS AS
SELECT
    InvoiceNo,
    StockCode,
    Description AS ProductDescription,
    Quantity,
    InvoiceDate,
    UnitPrice,
    Quantity * UnitPrice AS Sales_Amount,
    CustomerID,
    Country,
    CASE WHEN Quantity < 0 THEN TRUE ELSE FALSE END AS Return_Flag
FROM RAW_ONLINE_RETAIL;

-- Comments:
-- RAW_ONLINE_RETAIL represents the single source transaction table.
-- V_RETAIL_ANALYSIS is the cleaned analytical view for AI-ready retail analysis.
-- It includes sales_amount and return_flag.