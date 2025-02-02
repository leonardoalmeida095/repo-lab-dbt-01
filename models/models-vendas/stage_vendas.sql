
select
    v.*,  -- Seleciona todas as colunas da tabela tbl_vendas
    c.*  -- Seleciona todas as colunas da tabela tbl_clientes
from {{ ref("load_tbl_vendas") }} as v  -- Usa a função ref para referenciar a tabela tbl_vendas
inner join
    {{ ref("load_tbl_clientes") }} as c  -- Usa a função ref para referenciar a tabela tbl_clientes
    on v.client_id = c.client_id  -- Condição de junção: relaciona as tabelas pelo campo client_id
