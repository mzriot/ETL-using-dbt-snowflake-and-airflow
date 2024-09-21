
  
    

        create or replace transient table dbt_db.dbt_schema.int_order_items_summary
         as
        (select 
    order_key,
    sum(extended_price) as gross_item_sales_amount,
    sum(item_discount_amount) as item_discount_amount
from
    dbt_db.dbt_schema.int_order_items
group by
    order_key
        );
      
  