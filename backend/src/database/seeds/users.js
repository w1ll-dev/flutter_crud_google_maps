const encrypt = require('../../utils/encrypt');
const adminPasswordEncrypted = encrypt('admin')

exports.seed = knex =>
// Deletes ALL existing entries
knex('users').del()
  .then(() =>
    // Inserts seed entries
    knex('users').insert([
      {
        name: 'admin',
        password: `${adminPasswordEncrypted}`,
      },
    ]));
