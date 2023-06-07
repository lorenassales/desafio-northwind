with
    employees as (
        select *
        from {{ ref('stg_erp__employees') }}
    )

    , join_managers as (
        select
            employees.employee_id
            --, employees.manager_id           
            , employees.employee_name
            , managers.employee_name as manager_name       
            , employees.hire_date
            , employees.employee_address
            , employees.employee_city            
            , employees.employee_country           
        from employees        
        left join employees as managers on
            employees.manager_id = managers.employee_id
    )

    , changes as (
        select
            row_number() over (order by employee_id) as employee_sk
            , *
        from join_managers
    )
select *
from changes