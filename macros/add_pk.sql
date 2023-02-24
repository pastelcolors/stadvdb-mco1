{% macro add_primary_key_constraint(tbl, col) %}
  {% set relation_query %}

    ALTER TABLE {{ source('denormalize', tbl) }}
    ADD PRIMARY KEY ({{ col }});

  {% endset %}
  {% do run_query(relation_query) %}
{% endmacro %}

