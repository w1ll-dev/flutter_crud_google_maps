const express = require('express');
const router = express.Router();

const AuthController = require('../controllers/AuthController');
const EstablishmentsController = require('../controllers/EstablishmentsController');

router
    .post('/login', AuthController.login)
    .get('/logout', AuthController.logout)

    .get('/establishments', EstablishmentsController.index)
    .post('/establishments', EstablishmentsController.create)
    .put('/establishments/:id', EstablishmentsController.update)
    .delete('/establishments/:id', EstablishmentsController.delete)

module.exports = router;
