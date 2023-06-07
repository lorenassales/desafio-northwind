with
    orders as (
        select *
        from {{ ref('stg_erp__orders') }}
    )

    , order_details as (
        select *
        from {{ ref('stg_erp__order_details') }}
    )

    , joined_charts as (
        select
            orders.order_id
            , orders.customer_id
            , orders.employee_id
            , order_details.product_id
            , orders.ship_id
            , order_details.unit_price
            , order_details.quantity
            , order_details.discount
            , orders.order_date
            , orders.shipped_date
            , orders.required_date
            , orders.freight
            , orders.ship_name
            , orders.ship_city
            , orders.ship_country 
        from order_details
        left join orders on
            order_details.order_id = orders.order_id
    )
select *
from joined_charts