{% macro table_mco(args) %}
    {% set createtbl%}
    create or replace table t1(id number)
    {% endset%}
    {% do run_query(createtbl) %}
    
{% endmacro %}