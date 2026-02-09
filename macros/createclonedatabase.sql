{% macro createclonedatabase(src_db, tgt_db) %}
    {% set dd %}
    create or replace database {{tgt_db}} clone {{src_db}}  
    {% endset %}
    {% do run_query(dd)  %}
{% endmacro %}