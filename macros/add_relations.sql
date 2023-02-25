{% macro add_foreign_key_constraint(parent_table, parent_column, child_table, child_column) %}
  {% set relation_query %}

    ALTER TABLE {{ source('denormalize', child_table) }} 
    ADD CONSTRAINT fk_{{ parent_table }}_{{ parent_column }}_{{  child_table }}_{{ child_column }}
    FOREIGN KEY ({{ child_column }})
    REFERENCES {{ source('denormalize', parent_table) }}({{ parent_column }});

  {% endset %}
  {% do run_query(relation_query) %}
{% endmacro %}

{% macro drop_foreign_key_constraint(parent_table, parent_column, child_table, child_column) %}
  {% set relation_query %}

    ALTER TABLE {{ source('denormalize', child_table) }} 
    DROP CONSTRAINT fk_{{ parent_table }}_{{ parent_column }}_{{  child_table }}_{{ child_column }}

  {% endset %}
  {% do run_query(relation_query) %}
{% endmacro %}