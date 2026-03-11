-- models/staging/stg_retail_transactions.sql
-- Staging model: clean raw retail transaction data

SELECT *,
    COALESCE(store_id, 0) AS store_id_clean,
    LOWER(channel) AS channel_normalized,
    CASE
        WHEN device_type IS NULL THEN 'unknown'
        ELSE device_type
    END AS device_type_clean
FROM {{ source('raw', 'retail_transactions') }}
WHERE transaction_date IS NOT NULL
