{% set execution_date = var('execution_date') %}
{{
  config(
    materialized='incremental',
    incremental_strategy='delete+insert',
    unique_key='order_id',
    on_schema_change='sync_all_columns'
  )
}}

WITH raw_orders AS (
    SELECT 
        id AS order_id,
        customer as customer_id,
        ordered_at AS order_date,
        tax_paid,
        subtotal AS amount,
        order_total
    FROM {{ source('ecom', 'raw_orders') }}
)

SELECT
    order_id,
    customer_id,
    order_date,
    tax_paid AS tax_paid,
    amount AS amount,
    order_total AS order_total,
    -- Metadata column to track when this record was processed by dbt
    CURRENT_TIMESTAMP() AS dbt_processed_at
FROM raw_orders

{% if is_incremental() %}

  -- This filter will only be applied on an incremental run
  -- It finds records that have been updated since the last time this model ran
  WHERE 
    order_date >= '{{ execution_date }}'
  {# order_date >= (SELECT MAX(order_date) FROM {{ this }}) #}

{% endif %}
