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
    },
    async update(req, res, next) {
        try {
            const updates = {...req.body}
            console.log({body: req.body, param: req.params})
            const { id } = req.params
            await knex('establishments').update(updates).where({ id })
            return res.send()
        } catch (error) {
            next(error)
        }
    },
    async delete(req, res, next) {
        try {
            const { id } = req.params
            await knex('establishments').where({ id }).del()
            return res.send()
        } catch (error) {
            next(error)
        }
    }
}