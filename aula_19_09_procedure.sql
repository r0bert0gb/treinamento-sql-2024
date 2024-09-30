CREATE OR REPLACE PROCEDURE PRC_AREAS_ATUACOES (P_NOME_ATUACAO VARCHAR2) IS

    CURSOR C_VERIFICA_AREA_ATUACAO (C_NOME_ATUACAO VARCHAR2) IS
    SELECT COUNT(*) quantidade
    FROM tt_areas_atuacoes
    WHERE nome_atuacao = C_NOME_ATUACAO;

    v_qtde_areas INTEGER := 0;
    v_proximo_id INTEGER;
BEGIN

    -- Descobrir o ultimo ID:
    SELECT MAX(id_area_atuacao) + 1 INTO v_proximo_id FROM tt_areas_atuacoes;

    -- Se existe o nome:
    FOR res IN C_VERIFICA_AREA_ATUACAO(P_NOME_ATUACAO) LOOP
        v_qtde_areas := res.quantidade;
    END LOOP;

    IF v_qtde_areas = 0 THEN
        -- Inclusao
        INSERT INTO tt_areas_atuacoes(id_area_atuacao, nome_atuacao, criado_em, alterado_em)
            VALUES(v_proximo_id, p_nome_atuacao, sysdate, sysdate);
        COMMIT;
    END IF;

END PRC_AREAS_ATUACOES;
