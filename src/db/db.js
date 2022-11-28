import pg from "pg"
import { USERNAME, HOSTNAME, DBNAME, PASSWORD, PORT } from "../constants/index.js"

const pool = new pg.Pool({
    user: USERNAME,
    host: HOSTNAME,
    database: DBNAME,
    password: PASSWORD,
    port: 5432,
})
const query = (text, params) => pool.query(text, params)
export default query