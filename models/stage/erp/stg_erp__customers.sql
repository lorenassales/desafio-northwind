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
            , cast(address as string) as customer_address
            , cast(city as string) as customer_city
            , cast(region as string) as customer_region        
            , cast(country as string) as customer_country
        from customers
    )
select *
from changes