const knex = require('../database/');
const encrypt = require('../utils/encrypt');
const jwt = require('jsonwebtoken');
const secret = "Q3Tg9*cGN!m`EF~V"

module.exports = {
    async login(req, res) {
        const { name, password } = req.body;
        console.log(req.body)
        const passwordEncrypted = encrypt(password);
        const listUsers = await knex('users');

        for (let user of listUsers) {
            if (name === user.name && passwordEncrypted === user.password) {
                const id = 1;
                const token = jwt.sign({ id }, secret, { expiresIn: '1h' })
                return res.status(200).json({
                    auth: true,
                    token
                });
            } else {
                return res.status(403).send("invalid user or password");
            }
        }
    },
        
    logout(req, res) {
        res.json({
            auth: false,
            token: null
        });
    },

    verifyToken(req, res, next) {
        const token = req.headers["x-access-token"];

        if (!token) return res.status(401).json({
            auth: false,
            message: "no token provided"
        });

        jwt.verify(token, secret, (err, decoded) => {
            if(err) return res.status(500).json({
                auth: false,
                message: "Failed to authenticate token"
            });
            req.userId = decoded.id;
            next();
        })
    }
}