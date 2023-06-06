with
    employees as (
        select *
        from {{ source('erp', 'employees') }}
    )

    , changes as (
        select
            cast(employee_id as int) as employee_id
            , cast(reports_to as int) as manager_id
            , cast((last_name || " " || first_name) as string) as employee_name
            , cast(title as string) as role_of            
            , cast(hire_date as date) as hire_date
            , cast(address as string) as employee_address
            , cast(city as string) as employee_city
            , cast(region as string) as employee_region
            , cast(country as string) as employee_country           
        from employees
    )
select *
from changes