select
    event_id,
    customer_id,
    event_date::timestamp as event_date,
    lower(event_type) as event_type,
    plan,
    current_timestamp as ingestion_timestamp
from {{ source('bronze','SUBSCRIPTION_EVENTS') }}