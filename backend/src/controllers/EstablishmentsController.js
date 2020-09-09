const knex = require('../database');
const { update } = require('../database');

module.exports = {
    async index(req, res) {
        const results = await knex('establishments');
        return res.json(results);
    },
    async create(req, res, next) {
        try {
            const { name, lat, lng } = req.body
            await knex('establishments').insert({ name, lat, lng })
            res.status(201).send()
        } catch (error) {
            next(error)
        }

    }
}