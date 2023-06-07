with
    customers as (
        select *
        from {{ ref('dim_customers') }}
    )

    , employees as (
        select *
        from {{ ref('dim_employees') }}
    )

    , products as (
        select *
        from {{ ref('dim_products') }}
    )

    , shippers as (
        select *
        from {{ ref('dim_shippers') }}
    )

    , order_details as (
        select *
        from {{ ref('int_sales__order_detail') }}
    )

    , joined_charts as (
        select
            order_details.order_id
            , customers.customer_sk as customer_fk
            , employees.employee_sk as employee_fk
            , products.product_sk as product_fk
            , shippers.shipper_sk as shipper_fk
            , order_details.unit_price
            , order_details.quantity
            , order_details.discount
            , order_details.order_date
            , order_details.shipped_date
            , order_details.required_date
            , order_details.freight
            , order_details.ship_name
            , order_details.ship_city
            , order_details.ship_country
            , products.product_name
            , products.category_name
            , products.is_discontinued
            , employees.employee_name
            , employees.manager_name
            , shippers.company_name            
        from order_details
        left join customers on
            order_details.customer_id = customers.customer_id
        left join employees on
            order_details.employee_id = employees.employee_id
        left join products on
            order_details.product_id = products.product_id
        left join shippers on
            order_details.ship_id = shippers.shipper_id
    )

    , changes as (
        select
            {{ dbt_utils.generate_surrogate_key(['order_id', 'product_fk']) }} as sales_sk
            , *
            , unit_price * quantity as gross_income
            , unit_price * (1 - discount) * quantity as net_revenue
            , case
                when discount > 0 then true
                when discount = 0 then false
                else false
                end as is_discount
        from joined_charts
    )
select *
from changes