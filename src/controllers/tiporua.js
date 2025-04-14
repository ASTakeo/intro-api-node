const db = require('../dataBase/connection');

module.exports ={
    async listarTipoRua(request, response){
        try {
            const sql = 'SELECT ID_Tipo_Rua, NM_Tipo_Rua FROM TIPO_RUA;';
            const [rows] = await db.query(sql);

            return response.status(200).json({
                sucesso: true,
                mensagem: 'Lista de Tipos de Rua',
                itens: rows.length,
                dados: rows
        });

        }catch (error) {
            return response.status(500).json({
                sucesso: false,
                mensagem: 'Erro na requisição.',
                dados: error.mensage
            });
        }
    },

    async cadastrarTipoRua(request, response){
        try {
            // Os campos que serão utilizados no Insominia
            const {nm_tipo_rua} = request.body;
            const id_tipo_rua = 0;

            // Instrução SQl
            const sql = `INSERT INTO TIPO_RUA (NM_Tipo_Rua) 
                         VALUES (?);`;

            // Definição do valores do parâmetro
            const values = [nm_tipo_rua];

            // Executa o SQL
            const confirmacao = await db.query(sql, values);

            // Recupera o ID gerado
            const ID_Table = confirmacao[0].insertId;

            // Lista dos Dados Inseridos
            const dados = {
                id_tipo_rua,
                nm_tipo_rua
            }
                
            return response.status(200).json({
                sucesso: true,
                mensagem: 'Tipos de Rua Cadastro com Sucesso!',
                itens: rows.length,
                dados: rows
        });

        }catch (error) {
            return response.status(500).json({
                sucesso: false,
                mensagem: 'Erro na requisição.',
                dados: error.mensage
            });
        }
    },
}