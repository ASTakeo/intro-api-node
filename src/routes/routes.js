const express = require('express');
const router = express.Router();

// const UsuarioControler = require('../controllers/vistoria');
const ParametroControler = require('../controllers/parametro');

router.get('/Parametro', ParametroControler.listarParametro);

module.exports = router;