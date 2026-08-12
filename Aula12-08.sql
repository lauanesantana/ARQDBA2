

create table curso(
    id_curso int primary key,
    nome varchar(10) ); 
    
create table aluno(
    id_aluno int primary key,
    nome varchar(10), 
    id_curso int, 
    foreign key (id_curso) references curso (id_curso) ); 
    
insert into curso values (1, 'MySQL'); 
insert into curso values (2, 'Oracle'); 
insert into aluno values (100, 'Ana', 1); 
insert into aluno values (200, 'Bia', 1); 
insert into aluno values (300, 'Carla', null); 

select * from curso; 

select * from aluno; 

select a.nome, c.nome 
from aluno a, curso c
where a.id_curso = c.id_curso; 
/* where faz filtro */ 

select a.nome, c.nome from aluno a
inner join curso c on a.id_curso = c.id_curso; 
/* internamente, quando subo 2 tabelas no from, fica mais pesado, conjunto de dados */ 
/* como que mensuro qual dos dois é melhor? pego pelp pior cenário -> */ 

select a.nome, c.nome from aluno a 
    left outer join curso c on a .id_curso = c.id_curso; 
/* entre where e inner joi, use inner join */ 
/* dependendo da semantica use o inner ou uso o left */ 
