{% macro get_distinct_values_simplified(table_relations, column_name) %}
    {% set query_text %}
        SELECT DISTINCT {{ adapter.quote(column_name) }} FROM {{table_relations}} ORDER BY 1
    {% endset %}

    {% set results = run_query(query_text) %}

    {% if execute  %}
        {% set distinct_values = results.columns[0].values() %}
    {% else  %}
        {% set distinct_values = [] %}
    {% endif %}
    {{ return(distinct_values) }}
{% endmacro %}