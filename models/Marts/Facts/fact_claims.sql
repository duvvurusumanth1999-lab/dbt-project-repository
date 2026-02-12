{{
    config(
        materialized='table',
        pre_hook="TRUNCATE TABLE {{ this }}",
        post_hook="INSERT INTO DBT_DEV_DB.AUDIT_LOG.MODEL_RUN_LOG VALUES ('{{ this.name }}',CURRENT_TIMESTAMP(),'SUCCESS',(SELECT COUNT(*) FROM {{ this }}))"
    )
}}

select * from {{ ref('stg_claims') }}