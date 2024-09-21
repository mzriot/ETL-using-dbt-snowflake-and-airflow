select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select 
    *
from
    dbt_db.dbt_schema.fct_orders
where
    date(order_date) > CURRENT_DATE()
    or date(order_date) < date(1990-01-01)
      
    ) dbt_internal_test