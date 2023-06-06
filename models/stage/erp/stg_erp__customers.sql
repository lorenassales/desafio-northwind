with
    customers as (
        select *
        from {{ source('erp', 'customers') }}
    )

    , changes as (
        select
            cast(customer_id as string) as customer_id
            , cast(company_name as string) as company_name
            , cast(contact_name as string) as contact_name
            , cast(contact_title as string) as contact_title
            , cast(address as string) as address
            , cast(city as string) as city
            , cast(region as string) as region        
            , cast(country as string) as country
        from customers
    )
select *
from changes