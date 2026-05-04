# AGENTS.md

## Project Name

snowflake-ai-analytics-platform
Do not rename this repository.

## Project Overview

This project builds an AI-ready analytics platform using Snowflake.
The goal is NOT to build a simple AI chat application.
The goal is to design a data platform that AI can correctly understand and analyze.
Business users should be able to ask natural language questions and receive reliable analytical answers based on structured data.

## Core Concept

AI quality depends on data design.
This project focuses on:

* Data Mart design
* Semantic View
* Cortex Search (RAG)
* Cortex Agent
* Business metric definitions
* Query logging and feedback loop
  We are building a data-first AI system, not an app-first system.

## Architecture

User → Web App or API → Snowflake Cortex Agent → Semantic View / Cortex Search / Data Mart → Analytical answer

## Dataset

Use the UCI Online Retail Dataset.
The dataset includes:

* transactions
* customers
* products
* country information
  This dataset is used for:
* sales analysis
* customer segmentation
* product performance analysis
* regional trends
* return and cancellation insights

## Critical Rules

* Do NOT push directly to the main branch
* Always create a feature branch
* Always create a Pull Request
* Make small and focused changes
* Do NOT include secrets, credentials, API keys, Snowflake account URLs, or private keys
* Do NOT commit .env files
* Do NOT assume production data exists
* Do NOT over-engineer the system
* Always prioritize the Snowflake data platform over the web application layer

## Required Reading

Always read:

* docs/project-context.md
* docs/internal/codex-instructions.md
* docs/internal/human-playbook.md
* docs/internal/review-checklist.md

## Repository Structure

Expected structure:
docs/
docs/internal/
sql/
knowledge/
sample_data/
app/

## SQL Rules

Create SQL files under the sql/ directory.
Required files:

* 01_setup.sql
* 02_mart.sql
* 03_semantic.sql
* 04_search.sql
* 05_logs.sql
  Rules:
* Use Snowflake-compatible SQL
* Each file should be independently understandable
* Include clear comments
* Use readable formatting
* Avoid unnecessary complexity
* Ensure naming consistency
* Avoid destructive operations unless clearly needed

## Data Mart Rules

* Do NOT expose raw tables directly to AI
* Always create a cleaned analytical view (Data Mart)
* Join transaction, customer, product, and country data
* Include calculated fields such as sales_amount
* Ensure data is analysis-ready

## Semantic View Rules

* Define business meaning clearly
* Include metrics such as total sales, order count, average order value
* Include dimensions such as customer, country, product category
* Use descriptive comments

## Cortex Search Rules

* Create a knowledge table for definitions
* Include metric definitions and business rules
* Build a search service on top of the knowledge table
* Keep content simple and clear

## Knowledge Rules

Create files under knowledge/:

* metric_definitions.md
* business_rules.md
  Rules:
* Explain business terms clearly
* Avoid unnecessary technical jargon
* Focus on meaning, not implementation

## Logging Rules

Create a logging table AI_QUESTION_LOG.
Include:

* user question
* generated SQL
* response
* optional feedback
  Purpose:
* improve future responses
* enable learning loop

## Web Application Rules

The web app is NOT the priority.
If implemented:

* keep it simple
* do not include secrets
* use .env.example only
* provide question input, answer display, SQL display, and knowledge reference

## README Rules

README must include:

* project purpose
* architecture
* dataset explanation
* setup steps
* sample questions
* expected outputs
* security notes
* AI-assisted development explanation

## Review Checklist

Before completing any work:

* Is the repository structure clean
* Is the README understandable for a new user
* Are SQL files readable and well separated
* Are Snowflake objects named consistently
* Are there any secrets or local files included
* Is the implementation aligned with the core concept
* Is the solution simple and not over-engineered

## Final Goal

Build a clean, structured, AI-ready data platform that demonstrates strong data modeling, clear business definitions, reliable AI-driven analytics, and a reproducible development workflow
