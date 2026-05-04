# プロジェクト概要：Snowflake AI Analytics Platform

## Repository Name
snowflake-ai-analytics-platform
この名前は変更しない

## 概要
Snowflakeを用いたAI分析基盤を構築する。
SQL不要で自然言語分析を可能にする。

## コアコンセプト
AIアプリではなく、
AIが理解できるデータ基盤を作る。

## アーキテクチャ
User
↓
Web App
↓
API
↓
Cortex Agent
  ├─ Semantic View
  ├─ Cortex Search
  └─ Data Mart

## データ
UCI Online Retail Dataset

## 機能
- 自然言語分析
- SQL生成
- RAG
- ログ管理

## 非対象
- YouTube
- 本番データ
- secrets

## 成果物
- SQL
- Data Mart
- Semantic View
- README