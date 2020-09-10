const express = require('express');
const router = express.Router();

const AuthController = require('../controllers/AuthController');
const EstablishmentsController = require('../controllers/EstablishmentsController');

router
    .post('/login', AuthController.login)
    .get('/logout', AuthController.logout)

    .get('/establishments', AuthController.verifyToken, EstablishmentsController.index)
    .post('/establishments', AuthController.verifyToken, EstablishmentsController.create)
    .put('/establishments/:id', AuthController.verifyToken, EstablishmentsController.update)
    .delete('/establishments/:id', AuthController.verifyToken, EstablishmentsController.delete)

module.exports = router;
