-- 01_setup.sql: Database and schema setup for Snowflake AI Analytics Platform
-- This file sets up the foundational Snowflake database, warehouse, and schema.

CREATE WAREHOUSE IF NOT EXISTS AI_ANALYTICS_WH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 300
    AUTO_RESUME = TRUE;

CREATE DATABASE IF NOT EXISTS AI_ANALYTICS_DB;
USE DATABASE AI_ANALYTICS_DB;

CREATE SCHEMA IF NOT EXISTS RETAIL;
USE SCHEMA RETAIL;

-- Comments:
-- Warehouse, database, and schema are created in a Snowflake-compatible way.
-- Subsequent files define tables and views within AI_ANALYTICS_DB.RETAIL.