import mariadb from 'mariadb'

const pool = mariadb.createPool ({
    host: 'localhost'
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
