-- aula de gerenciamento de usuário e papéis (09/09/26)

-- para permitir a execução dos scripts de escrita
alter session set "_ORACLE_SCRIPT" = TRUE;

-- elimina o user1, caso ele exista
drop user user1 cascade;

-- criação do usuário USER1
create user user1
identified by usuario1
default tablespace users
temporary tablespace temp
quota 5M on users;


-- criação do usuário USER2
create user user2
identified by usuario2
default tablespace users
temporary tablespace temp;

alter user user2 quota 5M on users;

-- exercicio 2 
grant create session, create table to user1;

-- testando os conhecimentos 
drop user teste cascade; 
create user teste identified by 123; 
grant create session to teste; 

select * from dba_users;
desc dba_users; 

-- Exercicio 3: Criar um role chamado admin1 que contenha
-- privilégios para criar sessões, tabelas, views,
-- sequences e procedures
create role admin1;
grant create session, create table, create view, create sequence, create procedure to admin1; 
grant admin1 to user2; 

-- Atribuir o role admin1 para o usuário user2
-- Faça o teste de conexão
-- Crie a tabela Emp (emp_id, nome, salario)
