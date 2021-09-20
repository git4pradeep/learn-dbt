 select *  from 
 (  select CUSTOMER_ID, row_number() over (order by AMOUNT desc) as rnk from {{ ref('fct_orders') }} )
 where  rnk < 6