{{
    config(
        tags= ['dash_model_bi']
    )
}}

SELECT 
    DDATE,
    ID_SALESPERSON,
    ID_CARMAKE,
    TOTALSALE,
    TOTALCOM
FROM {{ref('prc_montly_sales_make')}} AS prcm
LEFT JOIN {{ref('dim_carmake')}} AS dimc ON prcm.CARMAKE = dimc.CARMAKE
LEFT JOIN {{ref('dim_saleperson')}} AS dimp ON prcm.SALESPERSON = dimp.SALESPERSON