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
            const [result] = await db.query(sql, values);

            // Recupera o ID gerado
            const ID_Table = result.insertId;

            // Lista dos Dados Inseridos
            const dados = {
                id_tipo_rua: ID_Table,
                nm_tipo_rua
            }
                
            return response.status(200).json({
                sucesso: true,
                mensagem: 'Tipos de Rua Cadastro com Sucesso!',
                dados: dados
        });

        }catch (error) {
            return response.status(500).json({
                sucesso: false,
                mensagem: 'Erro na requisição.',
                dados: error.mensage
            });
        }
    },

    async atualizarTipoRua(request, response){
        try {
            // Os campos que serão utilizados no Insominia
            const {nm_tipo_rua} = request.body;

            // Parametro recebido pela URL
            const {id_tipo_rua} = request.params;

            // Instrução SQl
            const sql = `UPDATE TIPO_RUA 
                         SET NM_Tipo_Rua = ?
                         WHERE ID_Tipo_Rua = ?;`;

            // Definição do valores do parâmetro
            const values = [nm_tipo_rua,id_tipo_rua];

            // Executa o SQL
            const atualizaDados = await db.query(sql, values);

            return response.status(200).json({
                sucesso: true,
                mensagem: `Tipos de Rua ${id_tipo_rua} atualizado com sucesso!`,
                dados: atualizaDados[0].affectedRows
        });

        }catch (error) {
            return response.status(500).json({
                sucesso: false,
                mensagem: 'Erro na requisição.',
                dados: error.mensage
            });
        }
    },

    async excluirTipoRua(request, response){
        try {
            // Os campos que serão utilizados no Insominia
            // const {nm_tipo_rua} = request.body;

            // Parametro recebido pela URL
            const {id_tipo_rua} = request.params;

            // Instrução SQl
            const sql = `DELETE FROM TIPO_RUA 
                         WHERE ID_Tipo_Rua = ?;`;

            // Definição do valores do parâmetro
            const values = [id_tipo_rua];

            // Executa o SQL
            const excluir = await db.query(sql, values);

            return response.status(200).json({
                sucesso: true,
                mensagem: `Tipos de Rua ${id_tipo_rua} excluído com sucesso!`,
                dados: excluir[0].affectedRows
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