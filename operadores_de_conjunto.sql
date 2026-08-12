-- 1. Criação das tabelas
CREATE TABLE A (
    A_ID NUMBER
);

CREATE TABLE B (
    B_ID NUMBER
);

-- 2. Inserção de dados na tabela A
INSERT INTO A (A_ID) VALUES (1);
INSERT INTO A (A_ID) VALUES (2);
INSERT INTO A (A_ID) VALUES (3);
INSERT INTO A (A_ID) VALUES (4);
INSERT INTO A (A_ID) VALUES (5);

-- 3. Inserção de dados na tabela B
INSERT INTO B (B_ID) VALUES (4);
INSERT INTO B (B_ID) VALUES (5);
INSERT INTO B (B_ID) VALUES (6);
INSERT INTO B (B_ID) VALUES (7);
INSERT INTO B (B_ID) VALUES (8);

-- Confirmar as inserções no banco de dados
COMMIT;

/* confirmar as inserções no banco de dados, commit no final, para refletir no disco, antes disso, nao reflete */ 

-- exemplo de uso do operador union; 

select a_id from a 
union 
select b_id from b; 

-- exemplo de uso do operador union all; 

select a_id from a 
union all
select b_id from b; 

-- exemplo de uso do operador intersect; 

select a_id from a 
intersect 
select b_id from b; 

-- exemplo de uso do operador minus; 

select a_id from a 
minus 
select b_id from b; 


