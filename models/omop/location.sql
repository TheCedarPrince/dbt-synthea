SELECT
    ROW_NUMBER() OVER () AS location_id
    , CAST(NULL AS VARCHAR) AS address_1
    , CAST(NULL AS VARCHAR) AS address_2
    , p.patient_city AS city
    , s.state_abbreviation AS state
    , CAST(NULL AS VARCHAR) AS county
    , p.patient_zip AS zip
    , p.patient_zip AS location_source_value
FROM {{ ref('stg_synthea__patients') }} AS p
LEFT JOIN {{ ref('stg_map__states') }} AS s ON p.patient_state = s.state_name
