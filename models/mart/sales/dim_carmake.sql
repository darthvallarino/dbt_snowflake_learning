{{
    config(
        tags= ['dash_model_bi']
    )
}}

SELECT 
    RANK() OVER(ORDER BY CARMAKE) AS ID_CARMAKE,
    CARMAKE
FROM {{ref('prc_montly_sales_make')}}
GROUP BY CARMAKE