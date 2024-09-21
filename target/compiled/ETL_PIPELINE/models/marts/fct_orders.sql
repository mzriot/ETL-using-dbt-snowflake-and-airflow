select
    orders.*,
    order_items_summary.gross_item_sales_amount,
    order_items_summary.item_discount_amount
from
    dbt_db.dbt_schema.stg_tpch_orders as orders
join
    dbt_db.dbt_schema.int_order_items_summary as order_items_summary
    on orders.order_key = order_items_summary.order_key
order by order_date