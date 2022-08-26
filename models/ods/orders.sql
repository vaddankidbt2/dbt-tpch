{{
    config(
        materialized = 'table',
        schema='ods',
        file_format='delta'
    )
}}
with orders as (

    select * from {{ ref('base_orders') }}

)
select 
    o.order_key, 
    o.order_date,
    o.customer_key,
    o.order_status_code,
    o.order_priority_code,
    o.order_clerk_name,
    o.shipping_priority,
    o.order_amount
from
    orders o
order by
    o.order_date