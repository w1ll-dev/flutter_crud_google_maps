const express = require('express');
const router = express.Router();

const AuthController = require('../controllers/AuthController');

router
    .post('/login', AuthController.login)
    .get('/logout', AuthController.logout)

module.exports = router;
