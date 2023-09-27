import mysql from "mysql2/promise";
import { DB_DATABASE,DB_HOST,DB_PORT,DB_USER,DB_PASSWORD } from "./config.js";

const config = {
    connectionLimit: 10,
    host: DB_HOST,
    user: DB_USER, 
    password: DB_PASSWORD, 
    database: DB_DATABASE,
    port: DB_PORT
};

const pool = mysql.createPool(config);
pool.getConnection((error, connection) =>{
    if(error)
        throw error;
    connection.release();
})

export default pool;