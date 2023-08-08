create database senai_tech;

use senai_tech;

create table departamentos (
id int,
nome varchar (60),
primary key (id)
);

create table funcionarios (
id int,
nome varchar (60),
sobrenome varchar (60),
salario decimal (10,2),
id_departamento int,
primary key (id),
foreign key (id_departamento) references departamentos (id)
);

#Liste nome, sobrenome e nome do departamento dos funcionários.
select f.nome, f.sobrenome, d.nome
from funcionarios f
inner join departamentos d on f.id_departamento = d.id;

#Liste nome, sobrenome e nome do departamento dos funcionários do departamentos de TI
select f.nome, f.sobrenome, d.nome
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
where d.nome='TI';

#Liste nome, sobrenome e nome do departamento dos funcionários do departamentos de TI ordenado pelo nome
select f.nome, f.sobrenome, d.nome
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
where d.nome='TI'
order by f.nome;

#Liste nome, sobrenome, salario e nome do departamento dos funcionários do departamentos de TI que recebem acima de 5000 ordenado pelo nome
select f.nome, f.sobrenome,f.salario, d.nome
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
where f.salario >5000 and d.nome = 'TI';

#Calcular a média salarial dos funcionários em cada departamento
select d.nome, avg(f.salario) as media_salarial
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
group by d.nome;

#Calcular a soma total dos salários de todos os funcionários no departamento de "Recursos Humanos“
select d.nome, sum(f.salario) as media_salarial
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
where d.nome = 'Recursos Humanos';

#Contar quantos funcionários cada departamento possui
select d.nome, count(f.id_departamento ) as total_funcionarios
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
group by d.nome;

#Listar os funcionários que ganham mais de 7000 em ordem alfabética
select f.nome, f.salario, d.nome
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
where f.salario >7000
order by f.nome;

#Mostrar o nome do departamento e a média de salário dos funcionários de cada departamento
select d.nome, avg(f.salario) as media_salarial
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
group by d.nome;

#Mostrar os funcionários que têm sobrenome “Matisse" e seus respectivos departamentos
select f.nome, f.sobrenome, d.nome 
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
where f.sobrenome = 'Matisse';

#Exemplo de Concat

select concat(f.nome, ' ',f.sobrenome) as nome_completo
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
where d.nome = 'TI';