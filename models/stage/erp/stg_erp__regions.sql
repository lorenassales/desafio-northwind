with
    regions as (
        select *
        from {{ source('erp', 'region') }}
    )

    , changes as (
        select
            cast(region_id as int) as region_id
            , cast(region_description as string) as region_description
        from regions
    )
select *
from changes