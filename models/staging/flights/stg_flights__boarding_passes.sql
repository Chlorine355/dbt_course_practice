{{
    config(
        materialized = 'table',
        )
}}

select * from {{ source('demo_src', 'boarding_passes') }}
  
    