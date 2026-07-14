{% macro round_off(column, scale=2) %}
    round(cast({{ column }} as numeric), {{ scale }})
{% endmacro %}
