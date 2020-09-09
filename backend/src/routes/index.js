const express = require('express');
const router = express.Router();

const AuthController = require('../controllers/AuthController');
const EstablishmentsController = require('../controllers/EstablishmentsController');

router
    .post('/login', AuthController.login)
    .get('/logout', AuthController.logout)
    
    .get('/establishments', EstablishmentsController.index)
module.exports = router;
