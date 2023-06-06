with
    suppliers as (
        select *
        from {{ source('erp', 'suppliers') }}
    )

    , changes as (
        select
            cast(supplier_id as int) as supplier_id
            , cast(company_name as string) as supplie_company_name
            , cast(contact_name as string) as supplie_contact_name
            , cast(contact_title as string) as supplie_contact_title
            , cast(address as string) as supplie_address
            , cast(city as string) as supplie_city
            , cast(country as string) as supplie_country
        from suppliers
    )
select *
from changes