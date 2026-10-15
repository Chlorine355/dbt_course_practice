select scheduled_departure::date as date, count(*) from {{ ref('fct_flights') }}
where departure_airport_id = 'MJZ' and status = 'Cancelled'
group by date
-- MJZ