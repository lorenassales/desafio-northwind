with
    employees as (
        select *
        from {{ source('erp', 'employees') }}
    )

    , changes as (
        select
            cast(employee_id as int) as employee_id
            , cast((last_name || " " || first_name) as string) as employee_name
            , cast(title as string) as role_of
            , cast(hire_date as date) as hire_date
            , cast(address as string) as address
            , cast(city as string) as city
            , cast(region as string) as region
            , cast(country as string) as country
            , cast(reports_to as int) as reports_to
        from employees
    )
select *
from changes