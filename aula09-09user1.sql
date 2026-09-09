-- criação de tabela 
-- funcionario (cod_func, nome, salario 

create table funcionario(
    cod_func int primary key, 
    nome varchar2 (30), 
    salario number(8, 2) ); 
    
insert into funcionario values (1, 'Lauane', 10000); 
select * from funcionario; 

-- dou permissao para o usuario teste ver minha tabela 
grant select on funcionario to teste; 
grant insert on funcionario to teste; 

insert into funcionario values (3, 'Elon Musk', 9000); 

grant select on funcionario to teste; 