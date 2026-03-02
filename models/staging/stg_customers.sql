select
    customer_id,
    signup_date::timestamp as signup_date,
    segment,
    country,
    industry,
    current_timestamp as ingestion_timestamp
from {{ source('bronze','CUSTOMERS') }}