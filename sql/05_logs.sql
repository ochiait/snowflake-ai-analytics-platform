-- 05_logs.sql: Logging table for AI question tracking
-- This file creates the logging table for AI interactions.

USE DATABASE AI_ANALYTICS_DB;
USE SCHEMA RETAIL;

CREATE OR REPLACE TABLE AI_QUESTION_LOG (
    ID INTEGER AUTOINCREMENT PRIMARY KEY,
    USER_QUESTION VARCHAR(1000),
    GENERATED_SQL VARCHAR(4000),
    RESPONSE VARCHAR(4000),
    FEEDBACK VARCHAR(500),  -- Optional user feedback
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    SESSION_ID VARCHAR(100)  -- Optional session tracking
);

-- Comments:
-- Includes user question, generated SQL, response, optional feedback.
-- Purpose: improve future responses and enable a learning loop.