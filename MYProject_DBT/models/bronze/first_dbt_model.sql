{{
  config(
    materialized = 'view',
    )
}}

Select * 
FROM {{source('default_source','my_first_dbt_model')}}