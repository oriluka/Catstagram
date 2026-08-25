import mariadb from 'mariadb'
import {db, username, password} from "./dbDetails";


const pool = mariadb.createPool ({
    host: 'localhost', user: username, password: password
});

async function asyncfunction(){
    let connection;
    try{
        connection = await pool.getConnection();
        // insert queries to DB here 

        // Get all 
        const rows = await connection.query("SELECT * from table");
        //
    } catch (error) {
        console.log(error);
    } finally {
        if (connection) connection.release();
    }
}
