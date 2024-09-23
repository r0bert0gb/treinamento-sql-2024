-- Conteudo aula 18/09/2024

-- ######### Subqueries ##########

-- sem subqueries
SELECT * FROM tt_disciplinas
WHERE id_disciplina IN (1);

SELECT * FROM tt_disciplinas
WHERE id_disciplina IN (1, 2);

-- com subqueries
SELECT * FROM tt_disciplinas
WHERE id_disciplina IN (SELECT ID_DISCIPLINA FROM tt_solicitacoes_matriculas);

-- Exercício:
-- trazer areas de atuacao que tenham correspondencia em tt_disciplinas
SELECT * FROM tt_areas_atuacoes
WHERE id_area_atuacao IN(SELECT id_area_atuacao FROM tt_disciplinas);

----

--- EXISTS eh mais performatico que o IN. EXISTS usa indices
SELECT * FROM tt_professores
WHERE EXISTS (SELECT 1 FROM tt_areas_atuacoes
WHERE TT_PROFESSORES.ID_AREA_ATUACAO = TT_AREAS_ATUACOES.id_area_atuacao);

-- SELECT * FROM tt_areas_atuacoes
-- WHERE EXISTS ( SELECT 1 FROM tt_areas_atuacoes

-- -----------------------

-- ########## Funcoes #############

/* FN_DESCRICAO_TIPOS_ATUACOES*/
CREATE OR REPLACE FUNCTION FN_DESCRICAO_TIPOS_ATUACOES
(
    P_ID_TIPO_ATUACAO IN NUMBER
) RETURN VARCHAR2 AS

V_RETORNO VARCHAR(2000);

BEGIN
    V_RETORNO := 'TESTE ROBERTO';
    RETURN V_RETORNO;
END FN_DESCRICAO_TIPOS_ATUACOES;



create or replace FUNCTION FN_DESCRICAO_TIPOS_PESSOAS
(
  P_ID_TIPO_PESSOA IN NUMBER 
) RETURN VARCHAR2 AS 
CURSOR C_DESCR_TIP_PESS (C_ID_TIPO_PESSOA INTEGER) IS
SELECT NOME FROM  TT_TIPOS_PESSOAS
WHERE ID_TIPO_PESSOA=C_ID_TIPO_PESSOA;
V_RETORNO  VARCHAR(2000);
BEGIN  
  FOR RES IN C_DESCR_TIP_PESS (P_ID_TIPO_PESSOA) LOOP
     V_RETORNO  :=  lower(RES.NOME);
  END LOOP;
  RETURN V_RETORNO;
END FN_DESCRICAO_TIPOS_PESSOAS;

-- -------

CREATE OR REPLACE FUNCTION FN_DESC_TIPOS_ATUACAO
(
    P_ID_AREA_ATUACAO IN NUMBER
) RETURN VARCHAR2 AS

CURSOR C_DESC_AREA_ATUACAO(C_ID_AREA_ATUACAO INTEGER) IS
    SELECT nome_atuacao FROM tt_areas_atuacoes
    WHERE id_area_atuacao = C_ID_AREA_ATUACAO;
    
V_RETORNO VARCHAR2(2000);

BEGIN
    FOR RES IN C_DESC_AREA_ATUACAO(P_ID_AREA_ATUACAO) LOOP

    V_RETORNO := RES.nome_atuacao;

    END LOOP;

    RETURN V_RETORNO;

END FN_DESC_TIPOS_ATUACAO;

--DROP FUNCTION FN_DESCRICAO_TIPOS_ATUACOES;




