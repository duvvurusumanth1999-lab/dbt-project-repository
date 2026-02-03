with ranked_sales as(
    SELECT
        order_id,
        order_date,
        product_code,
        customer_code,
        store_code,
        country_code,
        gross_amount,
        net_amount,
        quantity,
        discount_amount,
        currency_code,
        load_timestamp,
        ROW_NUMBER() OVER (
            PARTITION BY order_id
            ORDER BY load_timestamp DESC
        ) AS rn
    FROM {{ source('raw', 'raw_sales') }}
)

SELECT
    order_id,
    order_date,
    product_code,
    customer_code,
    store_code,
    country_code,
    gross_amount,
    net_amount,
    quantity,
    discount_amount,
    currency_code
FROM ranked_sales
WHERE rn = 1 
