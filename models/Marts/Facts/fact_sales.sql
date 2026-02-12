{{
    config(
        materialized='table',
        transient = false,
        pre_hook=["use warehouse DBT_S_WH"],
        post_hook=["use warehouse COMPUTE_WH"]
        
    )
}}

select
    -- Grain: 1 row per order
    order_id,
    order_date,

    -- Foreign Keys (Dimensions)
    product_code,
    customer_code,
    store_code,
    country_code,

    -- Base Measures from Sales
    gross_amount,
    discount_amount,
    quantity,

    -- Derived KPI: Net Sales
    (gross_amount - discount_amount) as net_sales,

    -- Derived KPI: Avg Selling Price
    (gross_amount - discount_amount) / nullif(quantity, 0) as avg_selling_price

from {{ ref('stg_sales') }}