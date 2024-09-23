/*criar a tabela tt_areas_atuacoes
id_area_atuacao
nome
criado_em
alterado_em

depois inserir dados na tabela tt_areas_atuacoes
*/

CREATE TABLE TT_AREAS_ATUACOES (
    id_area_atuacao INTEGER,
    nome_atuacao VARCHAR2(100),
    criado_em DATE,
    alterado_em DATE
);

ALTER TABLE TT_AREAS_ATUACOES ADD CONSTRAINT PK_AREAS_ATUACOES PRIMARY KEY(id_area_atuacao);

INSERT INTO tt_areas_atuacoes(id_area_atuacao, nome_atuacao, criado_em, alterado_em)
VALUES(1, 'Ci�ncias da Sa�de', SYSDATE, SYSDATE);

INSERT INTO tt_areas_atuacoes(id_area_atuacao, nome_atuacao, criado_em, alterado_em)
VALUES(2, 'Ci�ncias Humanas', SYSDATE, SYSDATE);

INSERT INTO tt_areas_atuacoes(id_area_atuacao, nome_atuacao, criado_em, alterado_em)
VALUES(3, 'Ci�ncias Biol�gicas', SYSDATE, SYSDATE);

INSERT INTO tt_areas_atuacoes(id_area_atuacao, nome_atuacao, criado_em, alterado_em)
VALUES(4, 'Lingu�stica', SYSDATE, SYSDATE);

UPDATE tt_areas_atuacoes SET nome_atuacao='Ci�ncias Exatas' WHERE id_area_atuacao=4;

DESCRIBE tt_areas_atuacoes;

COMMIT;