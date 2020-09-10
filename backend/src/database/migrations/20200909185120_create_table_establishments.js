
exports.up = knex => knex.schema.createTable('establishments', table => {
    table.increments('id');
    table.string('name', 30);
    table.float('lat', 14, 10).notNullable();
    table.float('lng', 14, 10).notNullable();

    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
});

exports.down = knex => knex.schema.dropTable('establishments');
