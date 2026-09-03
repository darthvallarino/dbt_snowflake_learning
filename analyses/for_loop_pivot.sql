{% set target_makes = ['Toyota', 'Ford', 'Chevrolet', 'Honda', 'Nissan'] %}

SELECT 
    DDATE,
    SALESPERSON,
    {% for make in target_makes%}
    SUM( CASE WHEN CARMAKE = '{{ make }}' THEN TOTALSALE ELSE 0 END ) AS sales_{{ make | lower }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM {{ ref('prc_montly_sales_make') }}
GROUP BY DDATE, SALESPERSON