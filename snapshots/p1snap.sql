{% snapshot snapshot_name %}
    {{
        config(
            target_schema='snapshots',
            unique_key='HOLDER_ID',
            strategy='check',
            check_cols=["Address"],
            invalidate_hard_deletes=true,
            
        )
    }}

    select * from {{ ref('Stg_policyholder') }}
 {% endsnapshot %}