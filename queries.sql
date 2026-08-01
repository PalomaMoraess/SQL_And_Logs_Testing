-- =====================================================
-- Sprint 6 - SQL Queries
-- TripleTen - Quality Assurance
-- =====================================================

---------------------------------------------------------
-- Tarefa 1
-- Quantidade total de táxis cadastrados
---------------------------------------------------------

SELECT
    COUNT(*) AS total_cabs
FROM
    cabs;


---------------------------------------------------------
-- Tarefa 2
-- Empresas com menos de 100 carros
---------------------------------------------------------

SELECT
    company_name,
    COUNT(*) AS cnt
FROM
    cabs
GROUP BY
    company_name
HAVING
    COUNT(*) < 100
ORDER BY
    cnt DESC;


---------------------------------------------------------
-- Tarefa 3
-- Classificação das condições climáticas
---------------------------------------------------------

SELECT
    ts,
    CASE
        WHEN description LIKE '%rain%'
          OR description LIKE '%storm%'
        THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions
FROM
    weather_records
WHERE
    ts BETWEEN '2017-11-05 00:00:00'
        AND '2017-11-05 23:59:59';


---------------------------------------------------------
-- Tarefa 4
-- Número de corridas por empresa
---------------------------------------------------------

SELECT
    cabs.company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM
    cabs
INNER JOIN
    trips
ON
    trips.cab_id = cabs.cab_id
WHERE
    CAST(trips.start_ts AS date)
    BETWEEN '2017-11-15' AND '2017-11-16'
GROUP BY
    company_name
ORDER BY
    trips_amount DESC;
