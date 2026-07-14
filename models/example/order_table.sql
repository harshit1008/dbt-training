{{
  config(
    materialized='table'
  )
}}

WITH raw_orders AS (
    SELECT 
        id AS order_id,
        customer as customer_id,
        ordered_at AS order_date,
        {{cents_to_dollars('tax_paid')}} AS tax_paid,
        {{cents_to_dollars('subtotal')}} AS amount,
        {{cents_to_dollars('order_total')}} AS order_total
    FROM {{ source('ecom', 'raw_orders') }}
)

SELECT
    order_id,
    customer_id,
    order_date,
    tax_paid,
    amount,
    order_total,
    -- Metadata column to track when this record was processed by dbt
    CURRENT_TIMESTAMP() AS dbt_processed_at
FROM raw_orders
