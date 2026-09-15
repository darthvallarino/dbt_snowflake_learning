{{
    config(
        materialized= 'incremental',
        incremental_strategy= 'merge',
        unique_key=['DDATE', 'SALESPERSON', 'CARMAKE'],
        tags= ['processing', 'sales', 'carmake']
    )
}}

SELECT 
    DATE_TRUNC('MONTH', DDATE) AS DDATE,
    SALESPERSON,
    CARMAKE,
    SUM(SALEPRICE - COMRATE) AS TOTALSALE,
    SUM(COMRATE) AS TOTALCOM
FROM {{ ref("stg_sales_data") }}
{% if is_incremental() %}
    -- Filtra solo los nuevos eventos de la última ejecución
    -- WHERE event_timestamp > (SELECT MAX(event_timestamp) FROM {{ this }})
    -- WHERE DDATE > (SELECT MAX(DDATE) FROM {{ this }})
    -- WHERE event_timestamp :: date >= dateadd(day, -3, current_date())
    WHERE DDATE :: date >= dateadd(day, -3, current_date())
{% endif %}
GROUP BY DATE_TRUNC('MONTH', DDATE), SALESPERSON, CARMAKE
--        incremental_strategy= 'insert_overwrite',
--        partition_by= {
--            "field": "DDATE",
--            "data_type": "date",
--            "granularity": "day" 
--        },