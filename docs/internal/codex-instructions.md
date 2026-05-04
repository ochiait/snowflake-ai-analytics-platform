# Codex Instructions

## Repository Name
snowflake-ai-analytics-platform

## ルール
- mainに直接pushしない
- featureブランチ使用
- PR作成
- secrets禁止

## タスク

### 1 構成
/docs
/sql
/knowledge
/app
/sample_data

### 2 SQL
01_setup.sql
02_mart.sql
03_semantic.sql
04_search.sql
05_logs.sql

### 3 Data Mart
- transaction
- customer
- product
- country
- sales_amount

### 4 Knowledge
metric_definitions.md
business_rules.md

### 5 Semantic View
sales, customer, country, product

### 6 Search
knowledgeテーブル + service

### 7 Logs
AI_QUESTION_LOG

### 8 README
- 概要
- 構成
- 手順

### 9 任意
- API
- UI