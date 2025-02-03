{{ config(materialized='view') }}

WITH stage_vendas AS (
    SELECT * FROM {{ ref('stage_vendas') }}
)

SELECT
    CASE
        WHEN LENGTH(CAST(documento AS STRING)) = 14 THEN 'Vendas_CPF'
        WHEN LENGTH(CAST(documento AS STRING)) = 18 THEN 'Vendas_CNPJ'
        ELSE 'Desconhecido'
    END AS tipo_cliente,
    FORMAT('%#.3f', SUM(pricing)) AS valor_Total
FROM
    `prj-lab-data-01.lab_data_dbt.stage_vendas`
GROUP BY tipo_cliente
