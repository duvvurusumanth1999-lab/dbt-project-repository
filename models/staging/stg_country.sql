{{
    config(
        materialized='table',
        transient= true
    )
}}

select
    country_code,
    country_name,
    region
from {{ source('raw', 'raw_country') }}