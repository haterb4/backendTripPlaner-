//import db from './../db/db.js'

export const getUsers = async (req, res) => {
    try {
        //const response = await db('select * from users')
        //console.log('response: ',response.rows)
        res.status(200).json({success: true, data: { userName: "Bradley", pseudo: "haterb"}})
    } catch (error) {
        console.log(error.message)
    }
}