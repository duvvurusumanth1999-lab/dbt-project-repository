{{
    config(
        materialized='table',
        transient=true
    )
}}

select
    date_id,
    year,
    quarter,
    month,
    month_name,
    week,
    day
from {{ source('raw', 'raw_date') }}