/*
- Instalação do MYSql Workbanch
  https://www.youtube.com/watch?v=c0YK0HBqZGk

- Pacote
  mysql-installer-community-8.0.41.0.msi
  
- MySQL
  - Usuário: root
    Senha  : 001806
  
  - Usuário: TCC
    Senha  : l224@tcc2025  

*/

/*

SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'your_database_name' 
AND TABLE_NAME = 'your_table_name';



  CREATE TABLE IF NOT EXISTS 
        PESSOA (ID_Pessoa            INT             AUTO_INCREMENT PRIMARY KEY
				  		 ,NM_Pessoa            VARCHAR(100)    NOT NULL
							 ,NO_Documento         VARCHAR(100)    UNIQUE NOT NULL
							 ,DT_Nascimento        DATETIME 
							 ,Endereco             VARCHAR(100)    NOT NULL
							 ,Bairro               VARCHAR(40)     NOT NULL
							 ,Complemento          VARCHAR(40) 
						 	 ,CEP                  VARCHAR(8)      NOT NULL
						 	 ,Telefone             VARCHAR(15)     NOT NULL
							 ,Email                VARCHAR(100) );


- MYSql
SELECT MD5('w3resource'); 

Explicação:

A declaração MySQL acima retorna o valor MD5 de w3resource. O valor de retorno é b273cb2263eb88f61f7133cd308b4064.

Saída:


ALTER DATABASE databasename CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE tablename CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;

              
FOREIGN KEY (ID_Pessoa) REFERENCES PESSOA(ID_PESSOA) ON DELETE CASCADE              

/*

DECLARE @g geography;   
SET @g = geography::Point(47.65100, -122.34900, 4326)  
SELECT @g.ToString();  

CREATE TABLE #LOCALIZACAO (COORDENADA GEOGRAPHY);

INSERT INTO #LOCALIZACAO (COORDENADA) VALUES (GEOGRAPHY::POINT(47.65100, -122.34900, 4326) );

SELECT coordenadas.Lat [Latitude]
      ,coordenadas.Long [Longitude] 
FROM localizacao

*/



*/


 /*
 Criar o banco de dados
 */
 
CREATE DATABASE DB;

ALTER DATABASE DB CHARACTER SET UTF8 COLLATE UTF8_UNICODE_CI;
--// ALTER TABLE tablename CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;


/*
CADASTRO DE SETORES: ZONA NORTE, ZONA LESTE, ZONA SUL, ZONA OESTE
*/
DROP TABLE IF EXISTS SETOR;  
CREATE TABLE SETOR (ID_Setor             INTEGER      AUTO_INCREMENT PRIMARY KEY   
                   ,NM_Setor             VARCHAR(30)  NOT NULL);
                   

/*
CADASTRO DOS BAIRROS
*/
DROP TABLE IF EXISTS BAIRRO;
CREATE TABLE BAIRRO (ID_Bairro          INTEGER         AUTO_INCREMENT PRIMARY KEY
                    ,NM_Bairro          VARCHAR(100)    NOT NULL
                    ,ID_Setor           INT             NOT NULL
  
  ,FOREIGN KEY (ID_Setor) REFERENCES SETOR(ID_Setor));     


/*
CADASTRO DE LOCALIDADE (Cidade)
*/
DROP TABLE IF EXISTS LOCALIDADE;
CREATE TABLE LOCALIDADE (ID_Localidade    INTEGER     AUTO_INCREMENT PRIMARY KEY
                        ,NM_Localidade    VARCHAR(50) NOT NULL
                        ,UF_Localidade    CHAR(2)     NOT NULL);
                        
INSERT INTO LOCALIDADE (ID_Localidade,NM_Localidade,UF_Localidade) VALUES (1,'TUPA','SP');                        

/*
CADASTRO DE RUAS
*/
DROP TABLE IF EXISTS RUA;  
CREATE TABLE RUA (ID_Rua           INTEGER       AUTO_INCREMENT PRIMARY KEY
                 ,TP_Rua           VARCHAR(15)   NOT NULL
                 ,NM_Rua           VARCHAR(100)  NOT NULL
                 ,CEP              CHAR(8)       NOT NULL
                 ,Numeracao        VARCHAR(30)   
                 ,ID_Bairro        INTEGER       NOT NULL
                 ,ID_Localidade    INTEGER       NOT NULL
                 
  ,FOREIGN KEY (ID_Bairro)     REFERENCES BAIRRO (ID_Bairro)
  ,FOREIGN KEY (ID_Localidade) REFERENCES LOCALIDADE(ID_Localidade)); 

  
 /*
 CADASTRO DE PESSOAS
 */
DROP TABLE IF EXISTS PESSOA;  
CREATE TABLE PESSOA (ID_Pessoa            INTEGER         AUTO_INCREMENT PRIMARY KEY
                    ,TP_Pessoa            CHAR(1)         NOT NULL   --// (F)isica / (J)uridica 
                    ,NM_Pessoa            VARCHAR(100)    NOT NULL
                    ,NO_Documento         VARCHAR(14)     NOT NULL
                    ,DT_Nascimento        DATE            NOT NULL 
                    ,NO_Endereco          VARCHAR(10)     NOT NULL 
                    ,Complemento          VARCHAR(50) 
                    ,Telefone             VARCHAR(15)     NOT NULL
                    ,Email                VARCHAR(100)
                    ,ID_Rua               INTEGER         NOT NULL
  
  ,FOREIGN KEY (ID_Rua) REFERENCES RUA (ID_Rua));


/*
CADASTRO DE FUNÇÃO: 
- Cargo é a posição que uma pessoa ocupa em uma organização 
- Função é o conjunto de atividades e responsabilidades associadas a essa posição. 
*/

DROP TABLE IF EXISTS FUNCAO; 
CREATE TABLE FUNCAO (ID_Funcao      INTEGER         AUTO_INCREMENT PRIMARY KEY
                    ,NM_Funcao      VARCHAR(40)     NOT NULL);
                  

/*
CADASTRO DO COLABORADOR/FUNCIONARIO
*/
DROP TABLE IF EXISTS COLABORADOR; 
CREATE TABLE COLABORADOR (ID_Colaborador  INTEGER         AUTO_INCREMENT PRIMARY KEY
                         ,Matricula       VARCHAR(20)     NOT NULL
                         ,SN_Temporario   CHAR(1)         NOT NULL   --// Contratos temporários (S/N)  
                         ,DT_Cadastro     DATETIME        NOT NULL
                         ,ID_Pessoa       INT             NOT NULL
                         ,ID_Funcao       INT             NOT NULL
                         
    FOREIGN KEY (ID_Pessoa) REFERENCES PESSOA (ID_Pessoa)
   ,FOREIGN KEY (ID_Funcao) REFERENCES FUNCAO (ID_Funcao));                          


/*
CADASTRO DO USUARIO
*/

DROP TABLE IF EXISTS USUARIO; 
CREATE TABLE USUARIO (ID_Usuario          INTEGER         AUTO_INCREMENT PRIMARY KEY
                     ,CD_Usuario          VARCHAR(30)     NOT NULL
                     ,ID_Colaborador      INTEGER         NOT NULL
                     ,Senha               VARCHAR(50)     NOT NULL
                     ,DT_Cadastro         DATETIME        DEFAULT TIMESTAMP
                     ,DT_Ultimo_Acesso    DATETIME
                     ,DT_Vegencia         DATETIME        NOT NULL
                     ,SN_Bloqueado        CHAR(1)         NOT NULL  
                     ,ID_Pessoa           INTEGER         NOT NULL 
                    
  FOREIGN KEY (ID_Colaborador) REFERENCES COLABORADOR(ID_Colaborador) ON DELETE CASCADE);


/*
 - Dengue
 - Escorpião
 - Chikungunya
 - Manejo Ambiental
 - Censitátio Canino (Leishmaniose)
 - Manejo Ambiental
 
 - Necessário informar o caminho do icone, para que seja possível
   demonstrar no mapa a diferenciação de ocorrências
 - Para cada tipo, somente poderá ser utilizado um cor padrão, não pode duplicar  
*/
DROP TABLE IF EXISTS TIPO_OCORRENCIA; 
CREATE TABLE TIPO_OCORRENCIA (ID_Tipo_Ocorrencia      INTEGER            AUTO_INCREMENT PRIMARY KEY
                             ,NM_Tipo_Ocorrencia      VARCHAR(100)       NOT NULL 
                             ,ID_Usuario              INTEGER            NOT NULL 
                             ,DT_Cadastro             DATETIME           DEFAULT TIMESTAMP
                             ,Icone                   VARCHAR(100)    --// Selecionar um icone padrão, informando o caminho, será demonstrado no mapa  
                             ,Cor                     VARCHAR(100));  --// Definir uma cor padrão que será demonstrado no mapa (tabela de cores ?)


/*
No caso de visita no mesmo domicilio, recuperar o(s) historico(s) anterior(es) ou mais recente
*/
DROP TABLE IF EXISTS VISTORIA; 
CREATE TABLE VISTORIA (ID_Vistoria      INTEGER      AUTO_INCREMENT PRIMARY KEY
                      ,ID_Colaborador   INTEGER      NOT NULL
                      ,DT_Cadastro      DATE         DEFAULT TIMESTAMP
                      ,ID_Rua           INTEGER      NOT NULL
                      ,NO_Imovel        VARCHAR(10)  NOT NULL
                      ,NM_Morador       VARCHAR(50)  NOT NULL
                      ,Telefone         VARCHAR(15)  NOT NULL
                      ,ST_Imovel        CHAR(1)      NOT NULL   --// (F)echado - (D)esocupado - (R)ecusa da visita
                      ,SN_Vistoriada    CHAR(1)                 --// (S)im - (N)ão
                      ,Historico        VARCHAR(255) NOT NULL   --// Historico da visita, ações realizadas, informações relevantes do processo    
                      ,ID_Ocorrencia    INTEGER      NOT NULL   --// Caso exista alguma ocorrência durante a visita ou alguma solicitação do morador com problemas            

/*
Itens que por padrão devem ser vistoriados. Deve haver documentação sobre este processo.
*/
Vistoria_Item (ID_Vistoria_Item
              ,ID_Vistoria
              ,)

CREATE TABLE OCORRENCIA (ID_Ocorrencia        INTEGER         AUTO_INCREMENT PRIMARY KEY
                        ,NO_Endereco          VARCHAR(10)     NOT NULL 
                        ,DT_Cadastro          DATE            TIMESTAMP
                        ,Historico            VARCHAR(300)    NOT NULL 
                        ,Latitude             DECIMAL(9,6)
                        ,Longitude            DECIMAL(9,6) 
                        ,ST_Status            Char(1)   
                        ,ID_Tipo_Ocorrencia   INT NOT NULL 
                        ,ID_Usuario           INT NOT NULL
                        ,ID_Rua               INT NOT NULL   

 ,FOREIGN KEY (ID_TipoOcorrencia) REFERENCES TIPO_OCORRENCIA(ID_TipoOcorrencia) ON DELETE CASCADE
 ,FOREIGN KEY (ID_Usuario)        REFERENCES USUARIO(ID_Usuario)                ON DELETE CASCADE
 
 ,FOREIGN KEY (ID_Rua));        
 
 REFERENCES ENDERECO(ID_Rua)              ON DELETE CASCADE);





