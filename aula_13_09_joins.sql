describe tt_disciplinas;
describe tt_areas_atuacoes;
describe tt_tipos_disciplinas;

select * from tt_disciplinas;
select * from tt_areas_atuacoes;
select * from tt_tipos_disciplinas;

insert into tt_areas_atuacoes(id_area_atuacao, nome_atuacao, criado_em, alterado_em)
values(5, 'Atuação qualquer', sysdate, sysdate);

insert into tt_disciplinas(id_disciplina, nome, criado_em, alterado_em, codigo, id_tipo_disciplina)
values(4, 'Disciplina sem área', sysdate, sysdate, 800, 3);

insert into tt_disciplinas(id_disciplina, nome, criado_em, alterado_em, codigo, id_area_atuacao)
values(5, 'Disciplina sem tipo', sysdate, sysdate, 900, 3);

--Inner join:
SELECT * FROM TT_DISCIPLINAS disc
INNER JOIN TT_AREAS_ATUACOES atuac
ON atuac.id_area_atuacao = disc.id_area_atuacao;

-- Natural join:
SELECT * FROM TT_DISCIPLINAS
NATURAL JOIN TT_AREAS_ATUACOES;

-- Left Join
SELECT * FROM TT_DISCIPLINAS disc
LEFT JOIN TT_AREAS_ATUACOES atuac
ON atuac.id_area_atuacao = disc.id_area_atuacao;

-- Right Join
SELECT * FROM TT_DISCIPLINAS disc
RIGHT JOIN TT_AREAS_ATUACOES atuac
ON atuac.id_area_atuacao = disc.id_area_atuacao;

-- Outer Join
SELECT * FROM TT_DISCIPLINAS disc
FULL OUTER JOIN TT_AREAS_ATUACOES atuac
ON atuac.id_area_atuacao = disc.id_area_atuacao;

SELECT * FROM TT_DISCIPLINAS, TT_AREAS_ATUACOES;