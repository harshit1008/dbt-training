select
 * 
from 
"dbt_training"."ecommerce"."model1_vw" model1_vw  inner join "dbt_training"."ecommerce"."model1_tbl" model1_tbl  on model1_vw.col1 = model1_tbl.col3