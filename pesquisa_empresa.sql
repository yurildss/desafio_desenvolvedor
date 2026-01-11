SELECT
    c.id_cliente AS codigo,
    c.razao_social,
    ct.numero AS telefone
FROM cliente c
JOIN estado e
    ON c.id_estado = e.id_estado
LEFT JOIN cliente_telefone ct
    ON ct.id_cliente = c.id_cliente
WHERE e.uf = 'SP'
ORDER BY c.id_cliente, ct.numero;
