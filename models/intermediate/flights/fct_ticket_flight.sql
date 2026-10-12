{{
      config(
        materialized = 'table',
        )
    }}


select
-- from stg_flights__ticket_flights
    fl.ticket_no as ticket_no,
    fl.flight_id as flight_id,
    fare_conditions,
    amount,
    case when boarding_no is not null then true else false end as boarding_pass_exists,
    boarding_no,
    seat_no,
    '{{ run_started_at }}' as load_date
from
{{ ref('stg_flights__ticket_flights') }} as fl left join {{ ref('stg_flights__boarding_passes') }} as bp on fl.ticket_no = bp.ticket_no