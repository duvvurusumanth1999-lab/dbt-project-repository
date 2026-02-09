{{
    config(
        materialized='table',
        transient=true
    )
}}

select
    store_code,
    store_name,
    store_type,
    region,
    country_code
from {{ source('raw', 'raw_store') }}