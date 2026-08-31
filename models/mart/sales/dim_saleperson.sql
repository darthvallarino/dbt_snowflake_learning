{{
    config(
        tags= ['dash_model_bi']
    )
}}

SELECT 
    RANK() OVER(ORDER BY SALESPERSON) AS ID_SALESPERSON,
    SALESPERSON
FROM {{ref('prc_montly_sales_make')}}
GROUP BY SALESPERSON