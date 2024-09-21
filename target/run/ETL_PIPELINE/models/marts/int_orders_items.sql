
  
    

        create or replace transient table dbt_db.dbt_schema.int_orders_items
         as
        (select 
    line_item.order_item_key,
    line_item.part_key,
    line_item.line_number,
    orders.order_key,
    orders.customer_key, 
    orders.order_date,
    
    (-1 * line_item.extended_price* line_item.discount)::decimal(16, 2)
 as item_discount_amount
from
    dbt_db.dbt_schema.stg_tpch_orders as orders
join
    dbt_db.dbt_schema.stg_tpch_line_items as line_item
    on orders.order_key = line_item.order_key
order by
    orders.order_date
        );
      
  