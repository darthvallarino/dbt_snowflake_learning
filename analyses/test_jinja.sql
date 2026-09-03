SELECT *
FROM {{ ref("stg_sales_data") }}
{% if target.name != 'prod_databooster' %}
LIMIT 10
{% endif %}