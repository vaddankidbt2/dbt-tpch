{{
    config(
        materialized = 'table',
        schema='ods',
        file_format='delta'
    )
}}
with nations as (

    select * from {{ ref('base_nation') }}

)
select 
    n.nation_key,
    n.nation_name,
    n.region_key
from
    nations n
order by
    n.nation_key