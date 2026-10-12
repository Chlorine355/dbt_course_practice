{{
    config(
        materialized = 'table',
        )
}}

select * from {{ source('demo_src', 'ticket_flights') }}
  
    