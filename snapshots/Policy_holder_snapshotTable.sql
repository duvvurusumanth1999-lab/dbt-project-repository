 {% snapshot Policy_holder_snapshotTable %}
    {{
        config(
            target_schema='snapshots',
            unique_key='HOLDER_ID',
            strategy='check',
            check_cols=["ADDRESS"],
            invalidate_hard_deletes=true,
            snapshot_meta_column_names={
          "dbt_valid_from": "start_date",
          "dbt_valid_to": "end_date"}
            
        )
    }}
    select * from {{ ref('Stg_policyholder') }}
   
 {% endsnapshot %}

