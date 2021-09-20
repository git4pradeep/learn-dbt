{{ config (
    materialized="incremental"
)}}

    select * from {{ ref('fct_orders') }}
	{% if is_incremental() %}
	where CUSTOMER_ID >= (select max(CUSTOMER_ID) from {{ this }})
    {% endif %}