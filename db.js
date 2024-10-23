const { Pool } = require('pg');

const pool1 = new Pool({
    user: 'postgres', // เปลี่ยนเป็น username ของคุณ
    host: 'localhost',
    database: 'login', // เปลี่ยนเป็นชื่อ database ของคุณ
    password: 'rootroot', // เปลี่ยนเป็น password ของคุณ
    port: 5433,
});

const pool2 = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'final',
    password: 'rootroot',
    port: 5433,
});

module.exports = { pool1, pool2 };