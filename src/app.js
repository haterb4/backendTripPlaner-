import express from 'express'
import bodyParser from 'body-parser'
import cookieParser from 'cookie-parser'
import cors from 'cors'

//import routes
import authRoutes from './routes/authRoutes.js'

const app = express()

app.use(bodyParser.json({ limit: '50mb', extended: true }))
app.use(bodyParser.urlencoded({ limit: '50mb', extended: true }))
app.use(cors())
app.use(cookieParser())

//binding the app root
app.use('/api', authRoutes)

//end app root building

export default app