with
    categories as (
        select *
        from {{ source('erp', 'categories') }}
    )

    , changes as (
        select
            cast(category_id as int) as category_id
            , cast(category_name as string) as category_name
            , cast(description as string) as description
        from categories
    )
select *
from changes