with events as (

    select *
    from {{ ref('stg_subscription_events') }}

),

latest_plan_per_month as (

    select
        customer_id,
        date_trunc('month', event_date) as month,
        plan,
        row_number() over (
            partition by customer_id, date_trunc('month', event_date)
            order by event_date desc
        ) as rn
    from events
    where event_type in (
        'subscription_started',
        'plan_upgraded',
        'plan_downgraded'
    )

),

filtered_latest as (

    select
        customer_id,
        month,
        plan
    from latest_plan_per_month
    where rn = 1

),

cancellations as (

    select
        customer_id,
        date_trunc('month', event_date) as month,
        1 as is_canceled
    from events
    where event_type = 'subscription_canceled'

)

select
    l.customer_id,
    l.month,
    l.plan,
    coalesce(c.is_canceled, 0) as is_canceled
from filtered_latest l
left join cancellations c
    on l.customer_id = c.customer_id
    and l.month = c.month