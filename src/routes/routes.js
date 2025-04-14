const express = require('express');
const router = express.Router();

// const UsuarioControler = require('../controllers/vistoria');
const ParametroControler = require('../controllers/parametro');
const TipoRuaControler = require('../controllers/tiporua');

router.get('/parametro', ParametroControler.listarParametro);
router.get('/tiporua', TipoRuaControler.listarTipoRua);
router.post('/tiporua', TipoRuaControler.cadastrarTipoRua);

module.exports = router;