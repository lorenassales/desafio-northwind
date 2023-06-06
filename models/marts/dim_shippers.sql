with
    shippers as (
        select *
        from {{ ref('stg_erp__shippers') }}
    )

    , changes as (
        select
            row_number() over (order by shipper_id) as shipper_pk
            , *
        from shippers
    )
select *
from changes