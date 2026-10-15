select aircraft_id, count(flight_id) from {{ ref("fct_flights") }}
group by aircraft_id

{% set source_relation = adapter.get_relation(
      database="dwh_flights",
      schema="intermediate",
      identifier="fct_flights")
%}


-- {{ source_relation }}
-- {{ source_relation.database  }}
-- {{ source_relation.schema  }}
-- {{ source_relation.identifier  }}
-- {{ source_relation.is_table  }}
-- {{ source_relation.is_view  }}
-- {{ source_relation.is_cte  }}