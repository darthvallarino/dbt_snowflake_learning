{{
    config(
        materialized= 'table',
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
GROUP BY DATE_TRUNC('MONTH', DDATE), SALESPERSON, CARMAKE