

-- Use the `ref` function to select from other models
{{ config(materialized='table') }}
select *
from {{ ref('intermediate_customer') }}
where id = 1
