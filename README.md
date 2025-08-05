# 📺 API REST de Los Simpson

Esta es una API REST desarrollada con Node.js y Express que permite consultar personajes y frases de la serie **Los Simpson**. La API está conectada a una base de datos y está desplegada en Render.

🔗 URL de la API en Github:  
https://github.com/Adalab/modulo-4-evaluacion-final-bpw-Paula-51

---

## 🚀 Tecnologías utilizadas

- Node.js
- Express
- MySQL (o la base de datos que utilices)
- Dotenv
- Git y GitHub

---

## 📂 Estructura del proyecto

/api-simpsons
│
├── routes/
│ ├── personajes.js
│ └── frases.js
│
├── db/
│ └── connection.js
│
├── .env
├── .gitignore
├── index.js
└── package.json

---

## 🔐 Variables de entorno

El archivo `.env` contiene las credenciales necesarias para conectarse a la base de datos:

> ⚠️ Este archivo **no debe subirse** al repositorio. Asegúrate de incluir `.env` en el `.gitignore`.

---

## 📌 Endpoints disponibles

### 🔸 `GET /personajes`

Devuelve un listado de todos los personajes de la base de datos.

**Ejemplo de respuesta:**

```json
[
  {
    "id": 1,
    "nombre": "Homero Simpson",
    "ocupacion": "Inspector de seguridad"
  },
  {
    "id": 2,
    "nombre": "Lisa Simpson",
    "ocupacion": "Estudiante"
  }
]

▶️ Cómo iniciar el proyecto en local

1. Clona el repositorio:

git clone https://github.com/tu-usuario/api-simpsons.git

2. Instala las dependencias:

npm install

3. Configura tu archivo .env con tus credenciales de base de datos.

4. Inicia el servidor:

npm start

5. Visita http://localhost:3000/personajes o http://localhost:3000/frases.

✍️ Autora
Paula
Desarrolladora web en formación, apasionada por el mundo frontend y fan de Los Simpson.

📮 Contacto
GitHub: @paula-51


```
