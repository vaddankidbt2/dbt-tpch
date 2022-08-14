{% macro dbt_housekeeping() -%}
    '{{ invocation_id }}'::varchar(200) as dbt_batch_id,
    '{{ run_started_at }}'::timestamp as dbt_batch_ts
{%- endmacro %}
