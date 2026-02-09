{% macro clean_string(column_name) %}

    NULLIF(trim({{ column_name }}), '')
    
{% endmacro %}