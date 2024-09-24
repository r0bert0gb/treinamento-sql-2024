-- Aula 24/09/2024
-- Revisao triggers

-- id esta indo automatico por causa da Trigger + sequence:
INSERT INTO tt_areas_atuacoes(nome_atuacao, criado_em, alterado_em)
VALUES('Area Qualquer ', SYSDATE, SYSDATE);

SELECT * FROM tt_areas_atuacoes;

-- Trigger para Update:
CREATE OR REPLACE TRIGGER TG_BRU_AREAS_ATUACOES --- BRU -> Before Update
BEFORE UPDATE ON tt_areas_atuacoes FOR EACH ROW

DECLARE

BEGIN
    IF :NEW.nome_atuacao != :OLD.nome_atuacao THEN -- valor antigo diferente do valor novo
        :NEW.ALTERADO_EM := SYSDATE+1; --- Recebe a data de amanha
    END IF;

END TG_BRU_AREAS_ATUACOES;

UPDATE tt_areas_atuacoes
SET nome_atuacao = 'Atuacao com novo nome'
WHERE id_area_atuacao = 5;

-- Criacao de tabela para outra trigger
CREATE TABLE tt_log_tabelas (
    id_log_tabela INTEGER,
    nome_tabela VARCHAR2(100),
    nome_trigger VARCHAR2(100),
    nome_operador VARCHAR2(100),
    operacao VARCHAR2(100),
    criado_em DATE,
    alterado_em DATE
);

CREATE OR REPLACE TRIGGER TG_BRD_AREAS_ATUACOES -- Before delete
BEFORE DELETE ON tt_areas_atuacoes FOR EACH ROW
DECLARE
BEGIN
    INSERT INTO tt_log_tabelas(nome_tabela, nome_trigger, nome_operador, operacao, criado_em, alterado_em)
        VALUES('TT_AREAS_ATUACOES', 'TG_BRD_AREAS_ATUACOES', 'Roberto B', 'Before Delete', SYSDATE, SYSDATE);

END TG_BRD_AREAS_ATUACOES;

SELECT * FROM TT_AREAS_ATUACOES;

SELECT * FROM tt_log_tabelas;

Delete from tt_areas_atuacoes
where id_area_atuacao = 6;

SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'tt_areas_atuacoes'; -- sem constraints

