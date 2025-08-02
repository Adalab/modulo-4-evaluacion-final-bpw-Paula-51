
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

//conexión con la BD (MySQL) es ASÍNCRONA (async/await)
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

//ENDPOINTS

//Post /frases - insertar una nueva frase
server.post('/frases', async (req, res) => {
    const { texto, personajes_id } = req.body;

    if (!texto || !personajes_id) {
        return res.status(400).json({ error: 'Faltan datos requeridos' });
    }

    try {
        const connection = await getConnection();
        const [result] = await connection.query(
            'INSERT INTO frases (texto, personajes_id) VALUES (?, ?)',
            [texto, personajes_id]
        );
        await connection.end();

        res.status(201).json({ message: 'Frase creada correctamente', id: result.insertId });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al crear la frase' });
    }
});


//Obtener todas las frases de los personajes
server.get('/frases', async (req, res) => {
    try {
      const connection = await getConnection();
      const [rows] = await connection.query('SELECT texto, nombre, apellido FROM frases JOIN personajes ON frases.personajes_id = personajes.id');
      await connection.end();
  
      res.json({
        info: { count: rows.length },
        results: rows
      });
    } catch (error) {
      res.status(500).json({ error: 'Error al listar las frases' });
    }
  });


  //Obtenr una frase específica por ID
  server.get('/frases/:id', async (req, res) => {
    const { id } = req.params;
    try {
      const connection = await getConnection();
      const [rows] = await connection.query(
        "SELECT frases.texto, personajes.nombre, personajes.apellido FROM frases JOIN personajes ON frases.personajes_id = personajes.id WHERE frases.id = ?",
        [id]
      );
      await connection.end();
      if (rows.length === 0) {
        return res.status(404).json({ error: 'Frase no encontrada' });
      }
      res.json(rows[0]);
    } catch (error) {
      console.error(error); // Esto ayuda a depurar
      res.status(500).json({ error: 'Error interno del servidor' });
    }
  });

//Put frases/:id Actualizar una frase existente
server.put('/frases/:id', async (req, res) => {
    const { id } = req.params;
    const { texto } = req.body;
  
    try {
      const connection = await getConnection();
      const [result] = await connection.query(
        'UPDATE frases SET texto = ? WHERE id = ?',
        [texto, id]
      );
      await connection.end();
  
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Frase no encontrada' });
      }
  
      res.json({ message: 'Frase actualizada correctamente' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Error al actualizar la frase' });
    }
  });

//Delete /frases/:id Eliminar una frase existente
server.delete('/frases/:id', async (req, res) => {
    const { id } = req.params;
  
    try {
      const connection = await getConnection();
      const [result] = await connection.query(
        'DELETE FROM frases WHERE id = ?',
        [id]
      );
      await connection.end();
  
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Frase no encontrada' });
      }
  
      res.json({ message: 'Frase eliminada correctamente' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Error al eliminar la frase' });
    }
  });

  //Get/frases/personaje/:personaje_id Obtener frases de un personaje específico
server.get('/frases/personaje/:personaje_id', async (req, res) => {
    const { personaje_id } = req.params;

    try {
        const connection = await getConnection();
        const [rows] = await connection.query(
            'SELECT frases.texto FROM frases WHERE personajes_id = ?',
            [personaje_id]
        );
        await connection.end();

        if (rows.length === 0) {
            return res.status(404).json({ error: 'No se encontraron frases para este personaje' });
        }

        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al obtener las frases del personaje' });
    }

});
