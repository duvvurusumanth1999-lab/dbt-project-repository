{{
    config(
        materialized='table',
        transient='false'
    )
}}

select
    customer_code,
    customer_name,
    customer_type,
    segment,
    city,
    state,
    country_code
    from {{ source('raw', 'raw_customer') }}