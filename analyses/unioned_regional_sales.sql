{% set regional_sales_source = [
    'REGIONAL_SALES_APAC',
    'REGIONAL_SALES_EU',
    'REGIONAL_SALES_NA'
] %}

{% set core_columns = [
    'order_id',
    'order_date',
    'customer_id',
    'product_id',
    'quantity',
    'total_amount'
] %}

{%  for sales_source_relation in regional_sales_source %}
SELECT
    '{{sales_source_relation}}' AS source_region_table,
    {%  for column_name in core_columns %}
    {{ column_name }}
    {% if not loop.last %},{% endif %}
    {% endfor %}
FROM {{ source('raw_bi_car', sales_source_relation) }}
{% if not loop.last %}
UNION ALL
{% endif %}
{% endfor %}