with mrr as (

    select *
    from {{ ref('fact_mrr_monthly') }}

),

customer_month as (

    select
        s.customer_id,
        s.month,
        coalesce(i.amount, 0) as mrr
    from {{ ref('int_active_subscriptions') }} s
    left join {{ ref('stg_invoices') }} i
        on s.customer_id = i.customer_id
        and s.month = date_trunc('month', i.invoice_date)

),

with_lag as (

    select
        customer_id,
        month,
        mrr,
        lag(mrr) over (
            partition by customer_id
            order by month
        ) as previous_mrr
    from customer_month

)

select * from with_lag