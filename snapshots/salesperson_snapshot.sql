{% snapshot salesperson_snapshot %}

{{
    config(
        target_schema='snapshot',
        unique_key='salesperson_id',
        strategy='timestamp',
        updated_at='last_updated_ts',
        invalidate_hard_deletes=True 
    )
}}

SELECT
    salesperson_id,
    salesperson_name,
    commision_rate,
    store_id,
    status,
    last_updated_ts
FROM  {{ source('raw_bi_car', 'SALESPERSON') }}

{% endsnapshot %}