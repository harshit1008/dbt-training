with
source as (
    select * from `dbt-training`.`raw_source`.`raw_customers`
),

renamed as (
    select
        id as customer_id,
        name as customer_name
    from source
)
select * from renamed