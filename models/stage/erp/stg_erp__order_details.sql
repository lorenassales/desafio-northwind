with
    order_details as (
        select *
        from {{ source('erp', 'order_details') }}
    )

    , changes as (
        select
            cast(order_id as int) as order_id
            , cast(product_id as int) as product_id
            , cast(unit_price as numeric) as unit_price
            , cast(quantity as int) as quantity
            , cast(discount as numeric) as discount
        from order_details
    )
select *
from changes