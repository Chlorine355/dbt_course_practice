{{
    config(
        materialized="incremental", incremental_strategy="append", tags=["booking"]
    )
}}

select book_ref, book_date, total_amount
from {{ source("demo_src", "bookings") }}

{% if is_incremental() %}
    where book_date >= coalesce((select max(book_date) from {{ this }}), '1900-01-01')
{% endif %}
