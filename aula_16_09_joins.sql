-- Nome do aluno, logradouro, numero e complemento

SELECT p.nome_aluno, e.logradouro, e.numero, e.complemento, a.email
FROM TT_ALUNOS a
INNER JOIN tt_pessoas p ON p.id_pessoa = a.id_pessoa
INNER JOIN tt_enderecos e ON 

-- Nome do aluno, nome da disciplina que foram solicitadas a matrícula para o ano de 2024/1

SELECT pessoas.nome_aluno, disc.nome_disciplina, solic_matric.

