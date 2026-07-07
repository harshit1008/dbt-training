
  create view "dbt_training"."ecommerce"."first_model__dbt_tmp"
    
    
  as (
    select '2026-10-12' as start_date,   10000 as revenue
  );