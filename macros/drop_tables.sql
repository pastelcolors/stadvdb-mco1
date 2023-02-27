{% macro drop_tables(table_names) %}
    {% for table_name in table_names %}
        {% set drop_query %}
          drop table if exists {{ source('denormalize', table_name) }};
        {% endset %}
        {% do run_query(drop_query) %}
    {% endfor %}
{% endmacro %}