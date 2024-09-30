-- Aula 30/09/2024

--  ########## Trabalhar com datas + case, when e decode

-- Case e when
select nome, case
    when id_area_atuacao = 1 then 'Ciencias da Saude'
    when id_area_atuacao = 2 then 'Ciencias Humanas'
    when id_area_atuacao = 3 then 'Ciencias Biologicas'
    when id_area_atuacao = 4 then 'Ciencias Exatas'
    else 'Sem area de atuacao'
    end as area_atuacao
from tt_disciplinas;

select id_area_atuacao, nome_atuacao from tt_areas_atuacoes;

-- Datas
-- https://docs.oracle.com/cloud/help/pt_BR/epm-common/FRWEB/date.htm
select to_char(criado_em, 'dd/mm/yyyy') from tt_pessoas;

select to_char(criado_em, 'dd/M/yyyy') from tt_pessoas;

select criado_em,
    to_char(criado_em, 'd') DIA_DA_SEMANA,
    to_char(criado_em, 'dd') DIA_DO_MES,
    to_char(criado_em, 'MM') MES,
    to_char(criado_em, 'YYYY') ANO,
    to_date('30/09/2024', 'DD/MM/YY') DATA_PELA_STRING,
    to_date('30/09/2024 12:22:34', 'DD/MM/YYYY HH:MI:SS') DATA_PELA_STRING_COM_HORA,
    to_char(criado_em, 'DD/MM/YYYY HH24:MI:SS'),
    case
        when to_char(criado_em, 'mm') = 3 then 'Mes do meu aniversario'
        else 'Nao eh o mes do meu aniversario'
    end aniversario
from tt_areas_atuacoes;

---

select * from tt_solicitacoes_matriculas
where to_char(criado_em, 'YYYY')=ANO;

SELECT * FROM TT_SOLICITACOES_MATRICULAS
WHERE TO_CHAR(CRIADO_EM,'YYYY')=ANO;

SELECT * FROM TT_SOLICITACOES_MATRICULAS
WHERE  TO_NUMBER(ANO) < TO_NUMBER(TO_CHAR(CRIADO_EM,'YYYY'));
