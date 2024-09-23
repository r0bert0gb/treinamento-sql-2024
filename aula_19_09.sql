-- Conteudo aula 19/09/2024

---------- 1. Funcoes de grupo e outras funcoes

-- Count
SELECT COUNT(ID_DISCIPLINA) FROM tt_disciplinas;

SELECT COUNT(*) FROM tt_disciplinas;

SELECT COUNT(id_area_atuacao) FROM tt_areas_atuacoes;

-- SUM
SELECT SUM(CARGA_HORARIA) FROM tt_disciplinas;

-- AVG
SELECT AVG(CARGA_HORARIA) FROM tt_disciplinas;

-- MAX
SELECT MAX(CARGA_HORARIA) FROM tt_disciplinas;

-- MIN
SELECT MIN(CARGA_HORARIA) FROM tt_disciplinas;

-- LOWER
-- UPPER
SELECT NOME, LOWER(NOME), UPPER(NOME) FROM tt_disciplinas;

-- AGRUPAMENTO
SELECT * FROM TT_CIDADES;
-- agrupar por estado e contar as cidades
-- RE 4
-- SC 3
-- RJ 2

SELECT e.nome_estado, COUNT(ID_CIDADES) FROM TT_CIDADES c
INNER JOIN tt_estados e ON c.id_estado = e.id_estado
GROUP BY e.nome_estado
ORDER BY e.nome_estado;


SELECT TO_CHAR(DATA_SOLICITACAO, 'DD/MM/YYYY HH:MI:SS') FROM tt_solicitacoes_matriculas
WHERE ID_ALUNO = 2;

SELECT C.NOME_CURSO FROM TT_CURSOS C
INNER JOIN TT_SOLICITACOES_MATRICULAS SM ON SM.ID_CURSO = C.ID_CURSO
WHERE SM.DATA_SOLICITACAO = (
    SELECT MAX(SM2.DATA_SOLICITACAO) FROM tt_solicitacoes_matriculas SM2
);

------- 2. Construcao de uma procedure para fazer um insert
-- 
-- EXEMPLO

SELECT * FROM TT_TIPOS_DISCIPLINAS;

