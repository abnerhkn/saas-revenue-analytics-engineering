select
    invoice_id,
    customer_id,
    invoice_date::timestamp as invoice_date,
    plan,
    amount::number(10,2) as amount,
    payment_status,
    current_timestamp as ingestion_timestamp
from {{ source('bronze','INVOICES') }}