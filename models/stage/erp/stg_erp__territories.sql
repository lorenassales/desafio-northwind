with
    territories as (
        select *
        from {{ source('erp', 'territories') }}
    )

    , changes as (
        select
            cast(territory_id as int) as territory_id
            , cast(region_id as int) as region_id
            , cast(territory_description as string) as territory_description            
        from territories
    )
select *
from changes