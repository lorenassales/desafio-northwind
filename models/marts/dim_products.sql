with
    products as (
        select *
        from {{ ref('stg_erp__products') }}
    )

    , categories as (
        select *
        from {{ ref('stg_erp__categories') }}
    )

    , suppliers as (
        select *
        from {{ ref('stg_erp__suppliers') }}
    )

    , joined_charts as (
        select
            products.product_id
            , categories.category_id
            , suppliers.supplier_id
            , products.product_name
            , products.quantity_per_unit
            , products.unit_price
            , products.units_in_stock
            , products.units_on_order
            , products.reorder_level
            , categories.category_name
            , suppliers.supplie_company_name
            , suppliers.supplie_city
            , suppliers.supplie_country       
        from products
        left join categories on
            products.category_id = categories.category_id
        left join suppliers on
            products.supplier_id = suppliers.supplier_id
    )

    , changes as (
        select
            row_number() over (order by product_id) as product_sk
            , *
        from joined_charts
    )
select *
from changes
