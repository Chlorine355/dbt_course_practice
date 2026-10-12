{{
    config(
        materialized = 'table',
        )
}}

select * from {{ source('demo_src', 'seats') }}
