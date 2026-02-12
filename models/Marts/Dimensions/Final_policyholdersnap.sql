select
    holder_id,
    holder_name,
    address,
    phone,
    status,
    dbt_valid_from as start_date,
    dbt_valid_to as end_date
from {{ ref('Policy_holder_snapshotTable') }}