
select
    product_code,
    product_name,
    brand,
    category,
    sub_category,
    pack_size,
    uom
from {{ ref('stg_product') }}