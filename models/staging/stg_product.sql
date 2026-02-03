{{
    config(
        materialized='table',
        transient='true'
    )
}}

with cte as (
 select
    product_code,
    product_name,
    brand,
    category,
    sub_category,
    pack_size,
    uom,
    row_number() over(PARTITION BY product_code order by load_timestamp desc) as rn
from {{ source('raw', 'raw_product') }}
)
select product_code,
    product_name,
    brand,
    category,
    sub_category,
    pack_size,
    uom
    from 
    cte where rn =1
