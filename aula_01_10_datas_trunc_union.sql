-- Aula 01/10/2024


-- trunk, round
SELECT TRUNC(22.43), ROUND(22.43), ROUND(22.53) FROM DUAL;

SELECT
    TRUNC(CRIADO_EM),
    TRUNC(SYSDATE),
    TO_CHAR(CRIADO_EM, 'DD/MM/YYYY HH24:MI:SS' ),
    TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS' ),
    ID_PESSOA,
    NOME
FROM TT_PESSOAS
WHERE TRUNC(CRIADO_EM) = TRUNC(SYSDATE);

-- ### Mais datas
SELECT 
CRIADO_EM ,
    TO_CHAR(CRIADO_EM,'d') DIA_DA_SEMANA,
    TO_CHAR(CRIADO_EM,'dd') DIA_Do_mes,
    TO_CHAR(CRIADO_EM,'YYYY') ANO,
    TO_CHAR(CRIADO_EM,'MM')  MES,
    TO_CHAR(CRIADO_EM,'DAY')  DIA_SEMANA_TEXTO,
    TO_CHAR(CRIADO_EM,'month')  mes_TEXTO,
    TO_CHAR(CRIADO_EM,'YEAR')  ano_TEXTO,
    TO_DATE('30/09/2024', 'DD/MM/YYYY' ) + 1 DATA_PELA_STRING,
    TO_DATE('30/09/2024 12:22:34', 'DD/MM/YYYY HH24:MI:SS' ) + 1 DATA_PELA_STRING_HORA,
    TO_CHAR(CRIADO_EM,'DD/MM/YYYY HH24:MI:SS')  
FROM TT_PESSOAS;

-- ### Union
select '1' consulta, upper(prof_coordenador) from tt_cursos
union
select '2' consulta, upper(nome_professor) from tt_professores
order by 1;

SELECT '1' C ,UPPER(TRIM(PROF_COORDENADOR))  FROM TT_CURSOS
UNION ALL
SELECT  '2' C  , UPPER(TRIM(NOME_PROFESSOR)) FROM TT_PROFESSORES
ORDER BY 2;

-- Todos os coordenares que nao sao professores
select upper(trim(prof_coordenador)) from tt_cursos
minus
select upper(trim(nome_professor)) from tt_professores;

-- Todos os coordenadores que sao professores
select upper(trim(prof_coordenador)) from tt_cursos
INTERSECT
select upper(trim(nome_professor)) from tt_professores;

-- 
select '1' C, upper(nome_atuacao) from tt_areas_atuacoes
union all
select '2' C, upper(nome) from tt_disciplinas;

--
SELECT  PROF_COORDENADOR  FROM TT_CURSOS
WHERE  UPPER(TRIM(PROF_COORDENADOR)) 
NOT IN (
      SELECT   UPPER(TRIM(NOME_PROFESSOR)) FROM TT_PROFESSORES);

SELECT  UPPER(TRIM(PROF_COORDENADOR))  FROM TT_CURSOS
MINUS
SELECT   UPPER(TRIM(NOME_PROFESSOR)) FROM TT_PROFESSORES




