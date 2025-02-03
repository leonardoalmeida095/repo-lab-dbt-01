SELECT 
    c.client_id,  -- ID do cliente
    c.documento,
    v.pricing
FROM {{ ref('load_tbl_clientes') }} AS c  -- Tabela de clientes
LEFT JOIN {{ ref('load_tbl_vendas') }} AS v ON c.client_id = v.client_id  -- Junção com a tabela de vendas
