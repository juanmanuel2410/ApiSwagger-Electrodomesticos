const express = require('express');
const sql = require('mssql');
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('./swagger.json');

// Configuración de la base de datos
const config = {
    user: 'juan',
    password: 'juan',
    server: 'DESKTOP-3L336FT',
    database: 'ElectrodomesticosDB',
    options: {
        trustedConnection: true,
        enableArithAbort: true,
        encrypt: true,
        trustServerCertificate: true
    }
};


// Inicializar la aplicación Express
const app = express();
app.use(express.json()); // para soportar el formato JSON en las solicitudes

const port = 3000;

// Rutas de la API

// Ruta GET para obtener un producto específico
app.get('/producto/:id', async (req, res) => {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('input_parameter', sql.Int, req.params.id)
            .query('SELECT * FROM Productos WHERE id = @input_parameter');

        // Imprimir resultados de la consulta
        console.log(result.recordset);

        res.send(result.recordset);
    } catch (err) {
        // Imprimir el error completo en la consola
        console.error(err);

        res.status(500).send('Error al acceder a la base de datos.');
    }
});

// Ruta GET para obtener todos los productos
app.get('/producto', async (req, res) => {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .query('SELECT * FROM Productos');

        // Imprimir resultados de la consulta
        console.log(result.recordset);

        res.send(result.recordset);
    } catch (err) {
        // Imprimir el error completo en la consola
        console.error(err);

        res.status(500).send('Error al acceder a la base de datos.');
    }
});

// Aquí puedes añadir más rutas para manejar otras operaciones
app.post('/producto', async (req, res) => {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('nombre', sql.NVarChar, req.body.nombre)
            .input('descripcion', sql.NVarChar, req.body.descripcion)
            .input('precio', sql.Float, req.body.precio)
            .query('INSERT INTO Productos (nombre, descripcion, precio) VALUES (@nombre, @descripcion, @precio)');
        res.status(201).send('Producto creado con éxito.');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al crear el producto en la base de datos.');
    }
});

app.put('/producto/:id', async (req, res) => {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('id', sql.Int, req.params.id)
            .input('nombre', sql.NVarChar, req.body.nombre)
            .input('descripcion', sql.NVarChar, req.body.descripcion)
            .input('precio', sql.Float, req.body.precio)
            .query('UPDATE Productos SET nombre = @nombre, descripcion = @descripcion, precio = @precio WHERE id = @id');
        res.send('Producto actualizado con éxito.');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al actualizar el producto en la base de datos.');
    }
});


app.delete('/producto/:id', async (req, res) => {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('id', sql.Int, req.params.id)
            .query('DELETE FROM Productos WHERE id = @id');
        res.send('Producto eliminado con éxito.');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al eliminar el producto en la base de datos.');
    }
});



// Configuración de Swagger UI
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Iniciar el servidor
app.listen(port, () => {
    console.log(`App running on http://localhost:${port}`);
});
