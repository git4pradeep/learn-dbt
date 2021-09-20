{{ config (
    materialized="table"
)}}

with customers as (

    select * from {{ ref('dim_customers')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),


fct_orders 
 as (

    select
        customers.customer_id,
        payments.order_id,
        payments.amount

    from customers
    left join orders  using (customer_id)
	left join payments using (order_id)

)

select * from fct_orders