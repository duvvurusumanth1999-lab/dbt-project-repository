select
    customer_code,
    customer_name,
    customer_type,
    segment,
    city,
    state,
    country_code
    from {{ ref('stg_customer') }}