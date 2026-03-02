# SaaS Revenue Analytics Engineering

## Business Context

SaaS companies depend on reliable subscription metrics to understand
growth, retention, and revenue health.\
This project simulates a real-world SaaS analytics environment and
implements core revenue intelligence metrics using a modern analytics
engineering approach.

The goal is to build a structured transformation layer that produces
reliable and documented business KPIs.

------------------------------------------------------------------------

## Architecture Overview

The project follows a layered architecture in Snowflake using dbt Cloud:

Bronze Layer\
Raw subscription data loaded into Snowflake tables.

Silver Layer\
Cleaned and standardized staging models.

Intermediate Layer\
Business logic transformations to reconstruct customer subscription
states and monthly MRR evolution.

Gold Layer\
Analytics-ready fact and dimension tables that power SaaS KPIs.

------------------------------------------------------------------------

## Technology Stack

-   Snowflake (Cloud Data Warehouse)
-   dbt Cloud (Transformation & Modeling)
-   SQL (Business Logic & Modeling)
-   GitHub (Version Control)

------------------------------------------------------------------------

## Data Model

### Dimension Tables

-   dim_customers

### Fact Tables

-   fact_mrr_monthly
-   fact_revenue_movements
-   fct_churn_monthly
-   fct_saas_metrics_monthly

------------------------------------------------------------------------

## Metrics Implemented

-   Monthly Recurring Revenue (MRR)
-   New MRR
-   Expansion MRR
-   Contraction MRR
-   Churn MRR
-   Net New MRR
-   Active Customers
-   Monthly Churn Rate

Revenue movements are classified as: - New - Expansion - Contraction -
Churn - No Change

------------------------------------------------------------------------

## Data Quality

Data validation is implemented using dbt tests:

-   not_null constraints
-   unique constraints
-   relationship integrity between fact and dimension tables

Documentation is generated using:

dbt docs generate

------------------------------------------------------------------------

## How to Run

1.  Configure Snowflake connection in dbt Cloud

2.  Run transformations:

    dbt run

3.  Execute data quality tests:

    dbt test

4.  Generate documentation:

    dbt docs generate

------------------------------------------------------------------------

## What This Project Demonstrates

-   Layered data modeling architecture
-   SaaS revenue analytics modeling
-   Dimensional modeling principles
-   Data quality engineering with dbt
-   End-to-end analytics engineering workflow

------------------------------------------------------------------------

## Future Improvements

-   Add orchestration with Airflow or Kestra
-   Implement dbt snapshots (SCD Type 2)
-   Integrate S3 + Athena for lakehouse architecture
-   Deploy executive dashboard

------------------------------------------------------------------------

Author: Abner Lima\
Analytics Engineer Portfolio Project
