with
    shippers as (
        select *
        from {{ source('erp', 'shippers') }}
    )

    , changes as (
        select
            cast(shipper_id as int) as shipper_id
            , cast(company_name as string) as company_name
        from shippers
    )
select *
from changes