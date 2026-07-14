{% macro alter_table_add_column(relation, column_name, data_type) %}

    
    {% if relation is string %}
        {%- set target_relation = adapter.get_relation(
            database=target. database,
            schema=target.schema,
            identifier=relation
        ) -%}
    {% endif %}
    
    {% if target_relation is not none %}
    
        {% set sql %}
            alter table {{ target_relation }} add column {{ adapter.quote(column_name) }} {{ data_type }}
        {% endset %}

        {% do run_query(sql) %}

    {% endif %}

    {% set sql %}
            update {{ target_relation }} set {{ adapter.quote(column_name) }} = 'harshit' where 1=1
    {% endset %}
    {% do run_query(sql) %}

{% endmacro %}


