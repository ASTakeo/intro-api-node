const express = require('express');
const router = express.Router();

// const UsuarioControler = require('../controllers/vistoria');
const ParametroControler = require('../controllers/parametro');
const TipoRuaControler = require('../controllers/tipo_rua');
const LocalidadeControler = require('../controllers/localidade');

router.get('/parametro', ParametroControler.listarParametro);

router.get('/tiporua', TipoRuaControler.listarTipoRua);
router.post('/tiporua', TipoRuaControler.cadastrarTipoRua);
router.patch('/tiporua/:id_tipo_rua', TipoRuaControler.atualizarTipoRua);
router.delete('/tiporua/:id_tipo_rua', TipoRuaControler.excluirTipoRua);

router.get('/localidade', LocalidadeControler.listarLocalidade);
router.post('/localidade', LocalidadeControler.cadastrarLocalidade);
router.patch('/localidade/:id_localidade', LocalidadeControler.atualizarLocalidade);
router.delete('/localidade/:id_localidade', LocalidadeControler.excluirLocalidade);

module.exports = router;