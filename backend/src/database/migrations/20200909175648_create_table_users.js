
exports.up = knex => knex.schema.createTable('users', table => {
    table.increments('id');
    table.string('name', 30).notNullable;
    table.string('password', 64).notNullable;

    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
});

exports.down = knex => knex.schema.dropTable('users');
