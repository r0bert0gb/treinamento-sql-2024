-- ########## Sequences
-- Banco vai gerenciar os ids atraves da sequence

-- Criando sequence para tt_tipos_disciplinas:
--CREATE SEQUENCE seq_areas_atuacoes;

drop sequence seq

-- Criando a partir do valor 10:
CREATE SEQUENCE seq_areas_atuacoes START WITH 10;

-- ver o proximo valor da sequence atraves da tabela DUAL
SELECT seq_tipos_disciplinas.nextval FROM dual;

-- ######### Triggers
/* Podem acontecer ANTES ou DEPOIS de uma transacao
    Conceitos, num update, de VALOR NOVO(NEW) e VALOR VELHO(OLD)
    
    Convencao de nomenclatura:
    TG_BRI_AVALIACOES -> BRI => Before Insert
*/
CREATE OR REPLACE TRIGGER  TG_BRI_AVALIACOES2   ----BEFORE ROW INSERT
 BEFORE INSERT ON TB_AVALIACOES FOR EACH ROW 
 DECLARE 
 BEGIN 
 IF :NEW.ID_AVALIACAO IS NULL THEN
 SELECT SEQ_AVALIACOES.NEXTVAL INTO  :NEW.ID_AVALIACAO FROM DUAL; 
 END IF; 
 END TG_BRI_AVALIACOES2;
 
CREATE OR REPLACE TRIGGER tg_bri_areas_atuacoes
BEFORE INSERT ON tt_areas_atuacoes FOR EACH ROW
DECLARE
BEGIN
    IF :NEW.id_area_atuacao IS NULL THEN
        SELECT seq_areas_atuacoes.nextval INTO :NEW.id_area_atuacao FROM DUAL;
    END IF;
END tg_bri_areas_atuacoes;
    










