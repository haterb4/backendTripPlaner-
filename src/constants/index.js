import dotenv from 'dotenv'
import path from "path"

dotenv.config({
    path: path.join(process.cwd(), '/src/config/.env')
})

export const PORT = process.env.PORT
export const HOSTNAME = process.env.HOSTNAME
export const DBNAME = process.env.DBNAME
export const DBPORT = process.env.DBPORT
export const USERNAME = process.env.USER_NAME
export const PASSWORD = process.env.PASSWORD
export const DIALECT = process.env.DIALECT
export const SECRET = process.env.SECRET
