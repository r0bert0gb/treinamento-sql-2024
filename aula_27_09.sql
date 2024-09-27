-- Aula 27/09/2024

-- Revisao Exceptions e Views
DECLARE
V_ID_PESSOA  INTEGER:=8;
BEGIN      
    V_ID_PESSOA  := V_ID_PESSOA / 0;  
    ---  V_ID_PESSOA:= 'Y';   
      EXCEPTION 
        WHEN ZERO_DIVIDE  THEN
              BEGIN
                RAISE_APPLICATION_ERROR(-20000, ' DIV POR ZERO ' || SQLCODE||SQLERRM);
           END;
         WHEN OTHERS THEN 
              RAISE_APPLICATION_ERROR(-20000, ' ATRIB INDEVIDA ' || SQLCODE||SQLERRM);
END;

--- Funcoes de string oracle
SELECT email FROM tt_alunos;

-- SUBSTR e INSTR

-- Murilo
SELECT
    email,
    substr(email,
           1,
           instr(email, '@') - 1)
FROM
    tt_alunos
WHERE
    upper(email) LIKE 'MARIA%';

-- Araujo
SELECT EMAIL, SUBSTR(EMAIL,1,INSTR(EMAIL, '@',1)-1)  USUARIO 
FROM TT_ALUNOS;
