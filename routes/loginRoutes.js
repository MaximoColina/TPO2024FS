const express = require('express'); 
const {crearUsuario, loginUsuario} = require('../controller/controllerUser'); 
const multer = require('multer');

/* Instanciamos la ruta */
const router = express.Router();
const upload = multer(); 

router.post('/api/register', upload.none(), crearUsuario); 

router.post('/api/login', upload.none(), loginUsuario);

module.exports = router; 