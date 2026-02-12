{{
    config(
        materialized='table',
        transient=true
    )
}}

select {{clean_string('name')}} as name from {{source('raw', 'raw_names')}}