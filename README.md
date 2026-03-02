# SaaS Revenue Analytics Engineering

## 1. Project Overview

This project simulates a SaaS B2B company.

The goal is to build a modern data pipeline and analytics layer using:

-   AWS S3
-   AWS Athena
-   AWS Glue Data Catalog
-   dbt (data transformation)
-   Apache Airflow (Docker)

This project shows skills in:

-   Data modeling
-   ELT pipelines
-   Incremental models
-   Snapshots (SCD Type 2)
-   Analytics engineering best practices

------------------------------------------------------------------------

## 2. Business Context

The company sells subscription plans to customers.

We want to answer important business questions:

-   What is our MRR (Monthly Recurring Revenue)?
-   What is the churn rate?
-   What is the Net Revenue Retention?
-   How many customers upgrade or downgrade?
-   What is the LTV (Lifetime Value)?

------------------------------------------------------------------------

## 3. Architecture

Data Flow:

1.  Synthetic data is generated using Python
2.  Data is stored in AWS S3 (raw layer)
3.  AWS Glue Catalog manages metadata
4.  AWS Athena queries the data
5.  dbt transforms data (staging → intermediate → marts)
6.  Airflow orchestrates the pipeline

Architecture layers:

-   Bronze: Raw data
-   Silver: Cleaned and typed data
-   Gold: Business metrics and fact tables

------------------------------------------------------------------------

## 4. Data Model

Main tables:

Dimensions: - dim_customer - dim_plan - dim_date

Facts: - fact_subscriptions - fact_invoices - fact_mrr_monthly -
fact_churn

Advanced: - Snapshot for customer plan changes (SCD Type 2) -
Incremental revenue models

------------------------------------------------------------------------

## 5. Metrics

Main business metrics:

-   MRR (Monthly Recurring Revenue)
-   Churn Rate
-   Net Revenue Retention (NRR)
-   Expansion Revenue
-   Contraction Revenue
-   LTV (Lifetime Value)

All metrics are defined inside dbt models.

------------------------------------------------------------------------

## 6. Tech Stack

-   Python (data generation)
-   AWS S3 (data lake storage)
-   AWS Athena (query engine)
-   AWS Glue (catalog)
-   dbt-core (transformation)
-   Apache Airflow (orchestration)
-   Docker (local environment)

------------------------------------------------------------------------

## 7. Project Structure

saas-revenue-analytics/ │ ├── data_generator/ ├── airflow/ ├──
dbt_project/ │ ├── models/ │ │ ├── staging/ │ │ ├── intermediate/ │ │
├── marts/ │ ├── snapshots/ │ └── tests/ ├── docker/ └── README.md

------------------------------------------------------------------------

## 8. Key Analytics Engineering Concepts

This project demonstrates:

-   Modern ELT architecture
-   Dimensional modeling
-   Incremental processing
-   Historical tracking (SCD2)
-   Data quality tests in dbt
-   Cost-aware cloud design

------------------------------------------------------------------------

## 9. Future Improvements

-   Add CI/CD with GitHub Actions
-   Add data quality monitoring
-   Add dashboard (Power BI or Looker Studio)
-   Add data contracts

------------------------------------------------------------------------

## 10. Author

Abner Hakinnen - Portfolio Project\
Created for learning and professional development.
