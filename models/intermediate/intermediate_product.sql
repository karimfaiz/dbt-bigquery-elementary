
-- Use the `ref` function to select from other models
{{ config(materialized='table') }}
select *
from {{ ref('raw_product') }}
where id = 1