
//CONFIGURAR EL SERVIDOR

import express from 'express'; //forma moderna de importar express
import cors from 'cors'; //importar cors
import mysql from 'mysql2/promise'; //1º importar mysql2 y 2º crear la conexion
import dotenv from 'dotenv'; //importar variables de entorno 
dotenv.config();
import bcrypt from 'bcrypt';//encriptar contraseña
import jwt from 'jsonwebtoken';//verificar token

const server = express(); //crear el servidor
const port = 4000; //crear el puerto

server.use(express.json()); //usar express
server.use(cors()); //usar cors

//escuchar el puerto
server.listen(port, () => {
    console.log(`Servidor escuchando por http://localhost:${port}`);
})

//conexión con la BD (MySQL) es ASÍNCRONA (async/await). aqui es donde incluimos las variables de entorno
const getConnection = async () => {
    const connection = await mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        port: process.env.DB_PORT
    })
    return connection;
}
/*
# generar y verificar token con jwt
JWT_SECRET_KEY= */




//ENDPOINTS (get, post, put, delete)
server.post("/frases", async (req, res) => {
    console.log("POST /frases " + JSON.stringify(req.body.params.texto)); //1º peticion

    let texto = req.body.params.texto; 
    let personaje_id = req.body.params.personaje_id; 
    let query = "INSERT INTO frases (texto, personajes_id) VALUES (?,?)"; 

    const connection = await getConnection(); //1º iniciar conexion

    
    connection.query(query, [texto, personaje_id])
        .then(([rows]) => {
            connection.end(); //3º finalizar conexion
            return res.json(rows); //4º respuesta
        })
        .catch((error) => {
            connection.end(); //3º finalizar conexion
            return res.status(500).json({ error:error.message }); //4º respuesta
        });
       
    // 1º iniciar conexion
    // 2º query (probar en mysql workbench para ver si la query devuelve lo que necesitas)
    // 3º finalizar conexion
    // 4º respuesta

    //probar endpoint: todos se pueden probar en postman, pero el tipo get es el unico que tambien se puede probar en navegador
 
})



