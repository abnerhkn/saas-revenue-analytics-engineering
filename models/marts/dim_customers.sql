with revenue as (

    select *
    from {{ ref('fact_revenue_movements') }}

),

aggregated as (

    select
        month,

        sum(mrr) as total_mrr,

        sum(case when revenue_movement = 'new' then revenue_delta else 0 end) as new_mrr,

        sum(case when revenue_movement = 'expansion' then revenue_delta else 0 end) as expansion_mrr,

        sum(case when revenue_movement = 'contraction' then revenue_delta else 0 end) as contraction_mrr,

        sum(case when revenue_movement = 'churn' then revenue_delta else 0 end) as churn_mrr,

        sum(revenue_delta) as net_new_mrr,

        count(distinct case when mrr > 0 then customer_id end) as active_customers

    from revenue
    group by 1

)

select *
from aggregated
order by month