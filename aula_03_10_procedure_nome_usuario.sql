-- Aula 03/10/2024

-- #### Procedure que receba o nome de uma pessoa e crie um usuario

-- adicionando um campo antes
ALTER TABLE tt_pessoas
ADD usuario varchar2(100);

create or replace PROCEDURE PRC_CRIA_USUARIO IS
 
    CURSOR C_PESSOAS IS
  SELECT ID_PESSOA,
                NOME,             
                SUBSTR( REPLACE(NOME, 'da','')  , 1,  INSTR(REPLACE(NOME, 'da','')  ,' ')-1)  PRIMEIRO_NOME,                
                SUBSTR( REPLACE(NOME, 'da','')  ,  INSTR(REPLACE(NOME, 'da','')  ,' ')+1,  LENGTH (REPLACE(NOME, 'da','')  ) - INSTR(REPLACE(NOME, 'da','')  ,' '))  SEGUNDO_NOME
           FROM TT_PESSOAS;
           --WHERE ID_PESSOA = 9;    
      V_NOME VARCHAR2 (100);
      V_SOBRENOME  VARCHAR2 (100);
      
 BEGIN
      FOR RES IN C_PESSOAS LOOP
           V_NOME:= LOWER(TRIM(RES.PRIMEIRO_NOME));
           V_SOBRENOME:=LOWER(TRIM(RES.SEGUNDO_NOME));
         dbms_output.put_line ('ID_PESSOA:'||RES.ID_PESSOA||'   USUARIO: '||V_NOME||'.'||V_SOBRENOME);
           UPDATE TT_PESSOAS
           SET USUARIO=V_NOME||'.'||V_SOBRENOME
           WHERE ID_PESSOA=RES.ID_PESSOA ;
      END LOOP;
 END;

begin
    prc_cria_usuario;
end;

select * from tt_pessoas;