-- incluir coluna

describe tt_disciplinas;
describe tt_areas_atuacoes;

alter table tt_disciplinas
add id_area_atuacao integer;

alter table tt_disciplinas
add constraint FK_AREA_ATUACAO__DISCIPLINA
FOREIGN KEY(id_area_atuacao)
REFERENCES tt_areas_atuacoes(id_area_atuacao);

select * from tt_areas_atuacoes;
select * from tt_disciplinas;

select * from tt_disciplinas, tt_areas_atuacoes
where tt_disciplinas.id_area_atuacao = tt_areas_atuacoes.id_area_atuacao;