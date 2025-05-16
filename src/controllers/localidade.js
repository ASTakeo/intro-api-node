const db = require('../dataBase/connection');

module.exports ={
    async listarLocalidade(request, response){
        try {
            const sql = `SELECT ID_Localidade
                               ,NM_Localidade
                               ,UF_Localidade
                         FROM LOCALIDADE;`;
            const [rows] = await db.query(sql);

            return response.status(200).json({
                sucesso: true,
                mensagem: 'Lista de Localidades',
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

    async cadastrarLocalidade(request, response){
        try {
            // Os campos que serão utilizados no Insominia
            const {nm_localidade, uf_localidade} = request.body;
            const id_localidade = 0;

            // Instrução SQl
            const sql = `INSERT INTO LOCALIDADE (NM_Localidade,UF_Localidade) 
                         VALUES (?,?);`;

            // Definição do valores do parâmetro
            const values = [nm_localidade, uf_localidade];

            // Executa o SQL
            const [result] = await db.query(sql, values);

            // Recupera o ID gerado
            const ID_Table = result.insertId;

            // Lista dos Dados Inseridos
            const dados = {
                id_localidade: ID_Table,
                nm_localidade,
                uf_localidade
            }
                
            return response.status(200).json({
                sucesso: true,
                mensagem: 'Localidade Cadastrado com Sucesso!',
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

    async atualizarLocalidade(request, response){
        try {
            // Os campos que serão utilizados no Insominia
            const {nm_localidade, uf_localidade} = request.body;

            // Parametro recebido pela URL
            const {id_localidade} = request.params;

            // Instrução SQl
            const sql = `UPDATE LOCALIDADE 
                         SET NM_Localidade = ?
                            ,UF_Localidade = ?
                         WHERE ID_Localidade = ?;`;

            // Definição do valores do parâmetro
            const values = [nm_localidade, uf_localidade,id_localidade];

            // Executa o SQL
            const atualizaDados = await db.query(sql, values);

            return response.status(200).json({
                sucesso: true,
                mensagem: `Localidade ${id_localidade} atualizado com sucesso!`,
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

    async excluirLocalidade(request, response){
        try {
            // Os campos que serão utilizados no Insominia
            // const {nm_tipo_rua} = request.body;

            // Parametro recebido pela URL
            const {id_localidade} = request.params;

            // Instrução SQl
            const sql = `DELETE FROM LOCALIDADE 
                         WHERE ID_Localidade = ?;`;

            // Definição do valores do parâmetro
            const values = [id_localidade];

            // Executa o SQL
            const excluir = await db.query(sql, values);

            return response.status(200).json({
                sucesso: true,
                mensagem: `Localidade ${id_tipo_rua} excluído com sucesso!`,
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