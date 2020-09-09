const knex = require('../database');
const { update } = require('../database');

module.exports = {
    async index(req, res) {
        const results = await knex('establishments');
        return res.json(results);
    },
}