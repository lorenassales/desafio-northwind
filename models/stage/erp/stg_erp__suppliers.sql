with
    suppliers as (
        select *
        from {{ source('erp', 'suppliers') }}
    )

    , changes as (
        select
            cast(supplier_id as int) as supplier_id
            , cast(company_name as string) as company_name
            , cast(contact_name as string) as contact_name
            , cast(contact_title as string) as contact_title
            , cast(address as string) as address
            , cast(city as string) as city
        from suppliers
    )
select *
from changes