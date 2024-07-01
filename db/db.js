const {createPool} = require('mysql2/promise'); 
require('dotenv').config();

const pool = createPool({

// variables orignales    
//    host: process.env.DB_HOST,
//    user: process.env.DB_USER,
//    password: process.env.DB_PASSWORD,
//    database: process.env.DB_DATABASE,
//    port: process.env.DB_PORT, 



// variables desde Clever Cloud
    host: process.env.MYSQL_ADDON_HOST,
    user: process.env.MYSQL_ADDON_USER,
    password: process.env.MYSQL_ADDON_PASSWORD,
    database: process.env.MYSQL_ADDON_DB,
    port: process.env.MYSQL_ADDON_PORT, 
    waitForConnections: true,
    connectionLimit: 5
});

pool.getConnection()
.then(connection => {
    pool.releaseConnection(connection);
    console.log('Base de datos conectada');
})
.catch(err => {
    console.error('Hubo un error al conectarse a la DB:', err);
});

module.exports = pool; 