with
    employee_territories as (
        select *
        from {{ source('erp', 'employee_territories') }}
    )

    , changes as (
        select
            cast(employee_id as int) as employee_id
            , cast(territory_id as int) as territory_id
        from employee_territories
    )
select *
from changes