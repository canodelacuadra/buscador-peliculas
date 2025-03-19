import express from 'express';
import mysql from 'mysql2';
const app = express();
const port = 3000;

const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "buscador_peliculas",
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
});
app.use(express.static('public'));
app.use(express.json());//para convertir texto en jsson
app.get("/api/v1/peliculas", (req, res) => {
    const consulta = 'SELECT * FROM peliculas';
    pool.query(consulta, (err, resultados) => {
        if (err) {
            console.error("Error en la consulta", err.message);
            return res.status(500).json({ error: "Error al consultar peliculas" });
        }
        res.status(200).json(resultados);
    });

});


app.listen(port, () => {
    console.log(`Escuchando por el puerto ${port}`)
})


