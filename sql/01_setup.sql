-- 01_setup.sql: Database and schema setup for Snowflake AI Analytics Platform
-- This file sets up the initial database structure for the UCI Online Retail Dataset

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS SNOWFLAKE_AI_ANALYTICS;

-- Use the database
USE DATABASE SNOWFLAKE_AI_ANALYTICS;

-- Create schema for retail data
CREATE SCHEMA IF NOT EXISTS RETAIL_SCHEMA;

-- Use the schema
USE SCHEMA RETAIL_SCHEMA;

-- Comments:
-- This file establishes the foundational database and schema.
-- No tables are created here; they will be defined in subsequent files.