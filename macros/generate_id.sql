{% macro generate_id( column_name ) %}
    RANK() OVER( ORDER BY {{ column_name }} )

{% endmacro %}