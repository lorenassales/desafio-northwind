with
    territories as (
        select *
        from {{ ref('stg_erp__territories') }}
    )

    , employees_territories as (
        select *
        from {{ ref('stg_erp__employee_territories') }}
    )

    , regions as (
        select *
        from {{ ref('stg_erp__regions') }}
    )

    , joined_charts as (
        select
            territories.territory_id
            , employees_territories.employee_id
            , regions.region_id
            , territories.territory_description 
            , regions.region_description
        from employees_territories
        left join territories on
            employees_territories.territory_id = territories.territory_id
        left join regions on
            territories.region_id = regions.region_id
    )

    , changes as (
        select
            row_number() over (order by territory_id) as territory_pk
            , *
        from joined_charts
    )
select *
from changes