{{
      config(
        materialized = 'incremental',
        incremental_strategy = 'append'
        )
}}

select book_ref, book_date, total_amount from {{ source('demo_src', 'bookings') }}

 {% if is_incremental() %}
   WHERE book_date >= coalesce((select max(book_date) from {{ this }}), '1900-01-01')
 {% endif %}