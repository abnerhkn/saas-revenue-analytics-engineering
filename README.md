# SaaS Revenue Analytics Engineering Project

## Overview

This project demonstrates an end-to-end SaaS Revenue Analytics pipeline
built using Snowflake and dbt Cloud.\
It follows a modern data architecture approach with layered modeling
(Bronze, Silver, Intermediate, Gold) and includes data quality
validation.

The objective of this project is to simulate a real-world SaaS analytics
environment and implement core subscription metrics such as MRR, churn
rate, and revenue movements.

------------------------------------------------------------------------

## Architecture

The project follows a layered data modeling strategy:

Bronze Layer\
Raw data loaded into Snowflake from generated CSV files.

Silver Layer\
Cleaned and standardized staging models.

Intermediate Layer\
Business logic transformations to reconstruct monthly subscription
states and customer-level MRR.

Gold Layer\
Analytics-ready fact and dimension tables for SaaS KPIs.

------------------------------------------------------------------------

## Tech Stack

-   Snowflake (Data Warehouse)
-   dbt Cloud (Data Transformation)
-   SQL (Modeling and Business Logic)
-   GitHub (Version Control)

------------------------------------------------------------------------

## Data Model

### Dimensions

-   dim_customers

### Fact Tables

-   fact_mrr_monthly
-   fact_revenue_movements
-   fct_churn_monthly
-   fct_saas_metrics_monthly

------------------------------------------------------------------------

## Key Metrics Implemented

-   Monthly Recurring Revenue (MRR)
-   New MRR
-   Expansion MRR
-   Contraction MRR
-   Churn MRR
-   Net New MRR
-   Active Customers
-   Monthly Churn Rate

------------------------------------------------------------------------

## Data Quality

Data validation is implemented using dbt tests:

-   not_null constraints
-   unique constraints
-   relationship integrity between fact and dimension tables

All transformations are documented using dbt docs.

------------------------------------------------------------------------

## How to Run

1.  Configure Snowflake connection in dbt Cloud
2.  Run: dbt run
3.  Validate data quality: dbt test
4.  Generate documentation: dbt docs generate

------------------------------------------------------------------------

## Project Goal

This project aims to demonstrate practical skills in:

-   Modern data warehouse architecture
-   Dimensional modeling
-   SaaS revenue analytics
-   Data transformation with dbt
-   Data quality engineering

------------------------------------------------------------------------

## Future Improvements

-   Add orchestration with Airflow or Kestra
-   Implement snapshots (SCD Type 2)
-   Integrate S3 and Athena for lakehouse architecture
-   Build executive dashboard for KPI visualization

------------------------------------------------------------------------

Author: Abner Lima\
Analytics Engineer Portfolio Project
