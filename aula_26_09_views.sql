-- Aula 26/09/2024

-- Views

-- Criar uma view com Disciplinas e areas_atuacoes

select * from tt_areas_atuacoes;

SELECT
    disc.codigo,
    disc.nome,
    disc.carga_horaria,
    disc.criado_em,
    disc.alterado_em,
    disc.id_area_atuacao,
    disc.id_tipo_disciplina,
    atuacao.id_area_atuacao,    
    atuacao.nome_atuacao,
    atuacao.criado_em,
    atuacao.alterado_em
FROM tt_disciplinas disc
INNER JOIN tt_areas_atuacoes atuacao ON atuacao.id_area_atuacao = disc.id_area_atuacao;

-- Criando a View:
CREATE OR REPLACE VIEW VW_DISCIPLINA_ATUACAO AS
SELECT
    disc.codigo AS "Codigo",
    disc.nome AS "Disciplina",
    disc.carga_horaria AS "Carga Horaria",
    disc.criado_em AS "Criada em 1",
    disc.alterado_em AS "Alterada em 1",
    disc.id_area_atuacao AS "id_area_atuacao 1",
    disc.id_tipo_disciplina AS "id_tipo_disciplina 1",
    atuacao.id_area_atuacao AS "id_area_atuacao 2",
    atuacao.nome_atuacao AS "Nome Atuacao",
    atuacao.criado_em AS "Criada em 2",
    atuacao.alterado_em AS "Alterada em 2"
FROM tt_disciplinas disc
INNER JOIN tt_areas_atuacoes atuacao ON atuacao.id_area_atuacao = disc.id_area_atuacao;

SELECT * FROM vw_disciplina_atuacao;

-- ############# Exceptions

/**EXCEPTIONS*/
DECLARE
V_ID_PESSOA  INTEGER:=8;
BEGIN      
      V_ID_PESSOA  := V_ID_PESSOA / 0;
     --- V_ID_PESSOA:= 'Y';
      EXCEPTION WHEN ZERO_DIVIDE  THEN
        DBMS_OUTPUT.PUT_LINE('NAO POSSO DIVIDIR POR ZERO'||TO_CHAR(SYSDATE, 'HH:MI:SS'));
         WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('OUTRAS EXCECOES'||TO_CHAR(SYSDATE, 'HH:MI:SS'));
END;

