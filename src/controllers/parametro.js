const db = require('../dataBase/connection');

module.exports ={
    async listarParametro(request, response){
        try {
            const sql = `SELECT ID_Parametro,NM_Empresa,NO_Documento,NO_RG_IE,Endereco,Bairro,Complemento,CEP,Cidade,UF,E_Mail,Site,Telefone,DT_Implantacao,Licenca,QT_Tentativa_Login,SN_Agenda_Retorno_Visita,QT_Dias_Agenda_Retorno FROM PARAMETRO;`;
            const [rows] = await db.query(sql);

            return response.status(200).json({
                sucesso: true,
                mensagem: 'Lista de Parâmetros',
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

    async atualizarParametro(request, response){
        try {
            const sql = `SELECT ID_Parametro,NM_Empresa,NO_Documento,NO_RG_IE,Endereco,Bairro,Complemento,CEP,Cidade,UF,E_Mail,Site,Telefone,DT_Implantacao,Licenca,QT_Tentativa_Login,SN_Agenda_Retorno_Visita,QT_Dias_Agenda_Retorno FROM PARAMETRO;`;
            const [rows] = await db.query(sql);

            return response.status(200).json({
                sucesso: true,
                mensagem: 'Atualiza Parâmetros',
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