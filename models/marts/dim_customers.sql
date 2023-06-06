with
    customers as (
        select *
        from {{ ref('stg_erp__customers') }}
    )

    , changes as (
        select
            row_number() over (order by customer_id) as customer_sk
            , *
        from customers
    )
select *
from changes