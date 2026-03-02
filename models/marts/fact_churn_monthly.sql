with revenue as (

    select *
    from {{ ref('fact_revenue_movements') }}

),

churned as (

    select
        month,
        count(distinct customer_id) as churned_customers,
        sum(abs(revenue_delta)) as churned_mrr
    from revenue
    where revenue_movement = 'churn'
    group by 1

),

base as (

    select
        month,
        count(distinct case when previous_mrr > 0 then customer_id end) as customers_at_risk
    from revenue
    group by 1

)

select
    c.month,
    c.churned_customers,
    c.churned_mrr,
    b.customers_at_risk,
    case
        when b.customers_at_risk = 0 then 0
        else c.churned_customers::float / b.customers_at_risk
    end as churn_rate
from churned c
left join base b
    on c.month = b.month
order by c.month