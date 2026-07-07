
  
    

  create  table "dbt_training"."ecommerce"."model3_downstream__dbt_tmp"
  
  
    as
  
  (
    select * from "dbt_training"."ecommerce"."model2_join"
  );
  