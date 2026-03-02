with subscriptions as (

    select *
    from {{ ref('int_active_subscriptions') }}
    where is_canceled = 0

),

invoices as (

    select
        customer_id,
        date_trunc('month', invoice_date) as month,
        amount
    from {{ ref('stg_invoices') }}

)

select
    s.month,
    sum(i.amount) as mrr
from subscriptions s
join invoices i
    on s.customer_id = i.customer_id
    and s.month = i.month
group by 1
order by 1