{% macro add_primary_key_constraint(tbl, col) %}
  {% set relation_query %}

    ALTER TABLE {{ ref(tbl) }}
    ADD PRIMARY KEY ({{ col }});

  {% endset %}
  {% do run_query(relation_query) %}
{% endmacro %}

