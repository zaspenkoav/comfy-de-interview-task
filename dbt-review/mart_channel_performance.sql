-- models/marts/mart_channel_performance.sql
-- Daily channel performance metrics for retail

{{ config(
    materialized='table'
) }}

WITH daily_stats AS (
    SELECT
        transaction_date,
        channel_normalized AS channel,
        COUNT(*) AS total_transactions,
        COUNT(customer_id) AS unique_customers,
        SUM(total_amount) AS total_revenue,
        SUM(quantity) AS total_items,
        SUM(CASE WHEN is_returned THEN 1 ELSE 0 END) AS returns_count
    FROM {{ ref('stg_retail_transactions') }}
    GROUP BY 1, 2
)

SELECT
    transaction_date,
    channel,
    total_transactions,
    unique_customers,
    total_revenue,
    ROUND(total_revenue / total_transactions, 2) AS avg_check,
    total_items,
    returns_count,
    ROUND(returns_count * 100.0 / total_transactions, 2) AS return_rate_pct
FROM daily_stats
