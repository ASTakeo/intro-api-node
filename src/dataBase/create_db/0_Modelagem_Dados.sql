 /*
 Criar o banco de dados
 */
 
-- // CREATE DATABASE DB;

-- // ALTER DATABASE DB CHARACTER SET UTF8 COLLATE UTF8_UNICODE_CI;
-- // ALTER TABLE tablename CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;


/*
Cadastro de Tabelas
- 
*/

DROP TABLE IF EXISTS TABELA;
CREATE TABLE TABELA (ID_Tabela             INTEGER      AUTO_INCREMENT PRIMARY KEY
                    ,NM_Fisico             VARCHAR(20)  NOT NULL
                    ,NM_Logico             VARCHAR(150) NOT NULL);
                                        
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('TABELA','Nomes lógicos de tabelas');

/*

Tabela de parâmetros gerais
- Será utilizada na geração dos cabeçalhos do relatórios se houver
- Qtde de tentativa de login

*/

DROP TABLE IF EXISTS PARAMETRO;
CREATE TABLE PARAMETRO (ID_Parametro             INTEGER      PRIMARY KEY   
                       ,NM_Empresa               VARCHAR(100) NOT NULL
                       ,NO_Documento             VARCHAR(20)  NOT NULL
                       ,NO_RG_IE                 VARCHAR(20)  NOT NULL
                       ,Endereco                 VARCHAR(40)  NOT NULL
                       ,Bairro                   VARCHAR(30)  NOT NULL
                       ,Complemento              VARCHAR(30)
                       ,CEP                      CHAR(9)      NOT NULL
                       ,Cidade                   VARCHAR(30)  NOT NULL
                       ,UF                       CHAR(2)      NOT NULL
                       ,E_Mail                   VARCHAR(100)
                       ,Site                     VARCHAR(100)
                       ,Telefone                 VARCHAR(15)  NOT NULL                       
                       ,DT_Implantacao           DATE         NOT NULL             -- // Data da implantação do sistema
                       ,Licenca                  VARCHAR(40)  NOT NULL             -- // Data da validade de licenças Criptografado 
                       ,QT_Tentativa_Login       SMALLINT     NOT NULL DEFAULT 0   -- // Qtde de tentativas de acesso do usuário
                       ,SN_Agenda_Retorno_Visita CHAR(1)      NOT NULL             -- // Agenda visita de retorno (Sim/Não)
                       ,QT_Dias_Agenda_Retorno   SMALLINT     NOT NULL DEFAULT 7   -- // Qtde de dias para calculo da data do retorno 
                       );
                        
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('PARAMETRO','Parâmetros Gerais do Sistema');
                   

/*
CADASTRO DE SETORES
- DFD: OK

*/
DROP TABLE IF EXISTS SETOR;  
CREATE TABLE SETOR (ID_Setor             INTEGER      AUTO_INCREMENT PRIMARY KEY   
                   ,NM_Setor             VARCHAR(30)  NOT NULL);
   
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('SETOR','Cadastro de Setores');
                      

/*
CADASTRO DE BAIRROS
- DFD: OK
*/
DROP TABLE IF EXISTS BAIRRO;
CREATE TABLE BAIRRO (ID_Bairro          INTEGER         AUTO_INCREMENT PRIMARY KEY
                    ,NM_Bairro          VARCHAR(100)    NOT NULL
                    ,ID_Setor           INTEGER         NOT NULL);

INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('BAIRRO','Cadastro de Bairros');

/*
CADASTRO DE LOCALIDADES (Cidade)
- DFD: OK

*/
DROP TABLE IF EXISTS LOCALIDADE;
CREATE TABLE LOCALIDADE (ID_Localidade    INTEGER     AUTO_INCREMENT PRIMARY KEY
                        ,NM_Localidade    VARCHAR(50) NOT NULL
                        ,UF_Localidade    CHAR(2)     NOT NULL);
                        
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('LOCALIDADE','Cadastro da Localidade');                       
                        
/*
CADASTRO DE TIPOS DE RUAS
- DFD: 
*/

DROP TABLE IF EXISTS TIPO_RUA;  
CREATE TABLE TIPO_RUA (ID_Tipo_Rua      INTEGER      AUTO_INCREMENT PRIMARY KEY
                      ,NM_Tipo_Rua      VARCHAR(30)  NOT NULL);
                 
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('TIPO_RUA','Cadastro de Tipos de Ruas');

/*
CADASTRO DE RUAS
- DFD: OK
*/
DROP TABLE IF EXISTS RUA;  
CREATE TABLE RUA (ID_Rua           INTEGER       AUTO_INCREMENT PRIMARY KEY
                 ,NM_Rua           VARCHAR(100)  NOT NULL
                 ,CEP              CHAR(8)       NOT NULL
                 ,Numeracao        VARCHAR(30)   
                 ,ID_Bairro        INTEGER       NOT NULL
                 ,ID_Localidade    INTEGER       NOT NULL
                 ,ID_Tipo_Rua      INTEGER       NOT NULL);
                 
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('RUA','Cadastro de Ruas');
 
/*
CADASTRO DE FUNÇÃO: 
- Cargo é a posição que uma pessoa ocupa em uma organização 
- Função é o conjunto de atividades e responsabilidades associadas a essa posição. 
- Poderá ser utilizada para definir restrições, porém será implementação futura

- DFD: OK
*/

DROP TABLE IF EXISTS FUNCAO; 
CREATE TABLE FUNCAO (ID_Funcao              INTEGER         AUTO_INCREMENT PRIMARY KEY
                    ,NM_Funcao              VARCHAR(40)     NOT NULL
                    ,SN_Agente_Comunitario  CHAR(1)         NOT NULL  DEFAULT 'N');

INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('FUNCAO','Cadastro de Funções'); 
  
 /*
 CADASTRO DE PESSOAS
 - DFD: OK
 
 */
DROP TABLE IF EXISTS PESSOA;  
CREATE TABLE PESSOA (ID_Pessoa            INTEGER         AUTO_INCREMENT PRIMARY KEY
                    ,TP_Pessoa            CHAR(1)         NOT NULL   -- // (F)isica / (J)uridica 
                    ,NM_Pessoa            VARCHAR(100)    NOT NULL
                    ,NO_Documento         VARCHAR(14)     NOT NULL
                    ,DT_Nascimento        DATE            NOT NULL 
                    ,NO_Imovel            VARCHAR(10)     NOT NULL 
                    ,Complemento          VARCHAR(50) 
                    ,NO_Telefone          VARCHAR(15)     NOT NULL
                    ,Email                VARCHAR(100)
                    ,ID_Rua               INTEGER         NOT NULL);
  
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('PESSOA','Cadastro de Pessoas'); 

/*

CADASTRO DO USUARIO
Qtde de tentativas ultrapassada (Tabela PARAMETRO), exibir mensagem "Usuário Bloqueiado, contactar o administrador"

 - DFD: OK
*/

-- // https://www-prisma-io.translate.goog/dataguide/mysql/introduction-to-data-types?_x_tr_sl=en&_x_tr_tl=pt&_x_tr_hl=pt&_x_tr_pto=sge#:~:text=Ao%20exibir%20datas%2C%20o%20MySQL,a%209999%2D12%2D31%20.
DROP TABLE IF EXISTS USUARIO; 
CREATE TABLE USUARIO (ID_Usuario          INTEGER         AUTO_INCREMENT PRIMARY KEY
                     ,CD_Usuario          VARCHAR(20)     NOT NULL
                     ,Senha               VARCHAR(50)     NOT NULL
                     ,DT_Cadastro         DATE            NOT NULL
                     ,DH_Acesso           DATETIME
                     ,DT_Vigencia         DATE            NOT NULL
                     ,SN_Bloqueado        CHAR(1)         NOT NULL  
                     ,ID_Pessoa           INTEGER         NOT NULL); 
                    
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('USUARIO','Cadastro de Usuários'); 
  
/*
CADASTRO DO COLABORADOR/FUNCIONARIO
 - DFD: OK
 
*/
DROP TABLE IF EXISTS COLABORADOR; 
CREATE TABLE COLABORADOR (ID_Colaborador         INTEGER         AUTO_INCREMENT PRIMARY KEY
                         ,Matricula              VARCHAR(20)     
                         ,SN_Temporario          CHAR(1)         NOT NULL                  -- // Contratos temporários (S/N)  
                         ,ID_Usuario_Cadastro    INTEGER         NOT NULL                  -- // Usuário que realizou do cadastro
                         ,DT_Cadastro            DATE            NOT NULL                  -- // DEFAULT TIMESTAMP
                         ,ID_Pessoa              INTEGER         NOT NULL   
                         ,ID_Funcao              INTEGER         NOT NULL);   
                         
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('COLABORADOR','Cadastro de Colaboradores/Funcionários'); 


/*
 - Dengue
 - Escorpião
 - Chikungunya
 - Manejo Ambiental
 - Censitátio Canino (Leishmaniose)

 - Necessário informar o caminho do icone, para que seja possível
   demonstrar no mapa a diferenciação de ocorrências
 - Para cada tipo, somente poderá ser utilizado um cor padrão, não pode duplicar  
 
 - DFD: OK
  
*/

DROP TABLE IF EXISTS TIPO_OCORRENCIA; 
CREATE TABLE TIPO_OCORRENCIA (ID_Tipo_Ocorrencia      INTEGER            AUTO_INCREMENT PRIMARY KEY
                             ,NM_Tipo_Ocorrencia      VARCHAR(50)        NOT NULL 
                             ,ID_Usuario_Cadastro     INTEGER            NOT NULL  
                             ,DT_Cadastro             DATE               NOT NULL 
                             ,Icone                   VARCHAR(100)      -- // Selecionar um icone padrão, informando o caminho, será demonstrado no mapa  
                             ,Cor                     VARCHAR(100) );   -- // Definir uma cor padrão que será demonstrado no mapa (tabela de cores ?)
                             
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('TIPO_OCORRENCIA','Cadastro de Tipos de Ocorrências'); 


/*
Cadastro de Unidades de Saúde, utilizados no cadastro de Visitas
https://cnes.datasus.gov.br/pages/estabelecimentos/consulta.jsp
*/

DROP TABLE IF EXISTS UNIDADE_SAUDE;
CREATE TABLE UNIDADE_SAUDE (ID_Unidade_Saude    INTEGER AUTO_INCREMENT PRIMARY KEY
                           ,NM_Unidade_Saude    VARCHAR(60) NOT NULL);               -- // Campo PSF (Pronto Socorro da Família) - Visita

INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('UNIDADE_SAUDE','Cadastro de Unidades de Saúde'); 


/*
No caso de visita no mesmo domicilio, recuperar o(s) historico(s) anterior(es) ou mais recente


1. O monitoramente constante é ir com frequência a lugares com risco de aparecimento de escorpiões 
 - cemitérios
 - campos de futebol
 - etc 

2. Não há ficha para isso. Em conversa 2 dados devem ser obrigatórios: 
 - Data da última vista
 - me disseram que é de 1 em 1 semana (ideia: mensagem de visita após esse tempo no app)
 - Quantidade de escorpiões pegos no local.


*/
DROP TABLE IF EXISTS VISITA; 
CREATE TABLE VISITA (ID_Visita              INTEGER      AUTO_INCREMENT PRIMARY KEY
                    ,ID_Colaborador_Agente  INTEGER      NOT NULL   -- // Agente Comunitário (Função de Agente - SN_Agente_Comunitario = S)
                    ,ID_Usuario_Cadastro    INTEGER      NOT NULL   -- // Usuário que cadastrou a visita 
                    ,DT_Cadastro            DATE                    -- // DEFAULT TIMESTAMP
                    ,DT_Solicitacao         DATE                    -- // Data da solicitação visita
                    ,DT_Atendimento         Date                    -- // Data da realização da visita  
                    ,ID_Rua                 INTEGER      NOT NULL   -- // Endereço
                    ,NO_Imovel              VARCHAR(10)  NOT NULL
                    ,NO_Telefone            VARCHAR(15)             
                    ,DS_Ponto_Referencia    VARCHAR(30)             -- // Ponto de referencia  
                    ,ID_Unidade_Saude       INTEGER      NOT NULL   -- // Unidade de Saúde (PSF)    
                    
                    ,ST_Imovel              CHAR(1)      NOT NULL   -- // (T)rabalhado
                                                                    -- // (F)echado
                                                                    -- // (D)esocupado
                                                                    -- // (R)ecusa da visita
                    ,SN_Vistoriada          CHAR(1)                 -- // (S)im - (N)ão
                         
                    ,SN_Acidente            CHAR(1)      NOT NULL   -- // Se ocorreu um acidente (S)im - (N)ão
                    ,SINAN                  Varchar(10)             -- // Sistema de Informação de Agravos de Notificação (https://portalsinan.saude.gov.br/)      
                    ,SN_Demanda_Expontanea  CHAR(1)      NOT NULL   -- // Se foi uma demanda expontanea (S)im - (N)ão
                    ,DS_Observacao          VARCHAR(200)            -- // Observações   
                    ,SN_Agenda_Retorno      CHAR(1)      NOT NULL   -- // Agendar retorno (S)im - (N)ão, caso seja sim o campo DT_Retorno deverá ser preenchida
                    ,DT_Retono              DATE                    -- // Data do retorno (trazer 1 semana por padrão, podendo ser alterado), será utilizado para mensagens de aviso    
                    ,ST_Status              CHAR(1));               -- // Situação da visita (A)ndamento - (E)ncerrado   

INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('VISITA','Cadastro de Visitas de Imóveis');  


/*
Itens que por padrão devem ser vistoriados. Deve haver documentação sobre este processo.

Se o campo "ST_Status" estive como encerrado, não poderá ser incluído novos itens de visita
*/
DROP TABLE IF EXISTS VISITA_ITEM; 
CREATE TABLE VISITA_ITEM (ID_Visita_Item        INTEGER      AUTO_INCREMENT PRIMARY KEY
                         ,ID_Visita             INTEGER      NOT NULL
                         ,ID_Tipo_Ocorrencia    INTEGER      NOT NULL     -- // Caso exista alguma ocorrência durante a visita ou alguma solicitação do morador com problemas 
                         ,DT_Visita             DATETIME     NOT NULL     -- // Data da visita
                         ,QT_Amostra_Coletada   INTEGER                   -- // Qtde de insetos, larvas, etc        
                         ,DS_Ocorrencia         VARCHAR(255) NOT NULL     -- // Historico da visita, ações realizadas, informações relevantes do processo 
                         ,NM_Morador            VARCHAR(50)  NOT NULL     -- // Nome do morador na data da visita
                         ,DT_Nascimento         DATE         NOT NULL     -- // Será utilizado para calcular a idade e listar na tela (15 anos, 3 semanas )      
                         ,ID_Colaborador        INTEGER      NOT NULL);   -- // Agente da Visita (Pode ser diferente do agente da abertura da visita) 
                         
INSERT INTO TABELA (NM_Fisico,NM_Logico) VALUES ('VISITA_ITEM','Cadastro de Itens das Visitas de Imóveis');  



-- // https://cnes2.datasus.gov.br/Lista_Es_Municipio.asp?VEstado=35&VCodMunicipio=355500&NomeEstado=

-- // https://viacep.com.br/ws/sp/tupã/cherente/json/