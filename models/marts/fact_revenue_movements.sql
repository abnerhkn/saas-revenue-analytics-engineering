with customer_mrr as (

    select *
    from {{ ref('int_mrr_per_customer_month') }}

),

classified as (

    select
        customer_id,
        month,
        mrr,
        previous_mrr,

        case
            when previous_mrr is null and mrr > 0 then 'new'
            when previous_mrr = 0 and mrr > 0 then 'new'
            when previous_mrr > 0 and mrr = 0 then 'churn'
            when mrr > previous_mrr then 'expansion'
            when mrr < previous_mrr then 'contraction'
            else 'no_change'
        end as revenue_movement,

        mrr - coalesce(previous_mrr, 0) as revenue_delta

    from customer_mrr

)

select *
from classified