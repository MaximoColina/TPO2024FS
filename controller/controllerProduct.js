const pool = require('../db/db');  

const obtenerProductos = async (req, res) =>{
    try{
        const connection = await pool.getConnection(); 
        const [rows] = await connection.query("SELECT * FROM productos"); 
        connection.release();
        res.json(rows);  
    }catch(err){
        console.error('Hubo un error a lobtener los productos:', err); 
    }
}

const crearProductos = async (req, res) => {
    const {id, id_categoria, nombre, precio, descripcion, stock, imagen } = req.body;
    //const imagen = req.file.filename;  
    req.body.imagen = req.file.filename;  
    req.body.id_categoria = parseInt(req.body.id_categoria);
    req.body.precio = parseFloat(req.body.precio);
    req.body.stock = parseInt(req.body.stock);
    try{
        const connection = await pool.getConnection();

        if (req.body.id){
            const sql =`
                UPDATE productos SET 
                    id_categoria = ?, 
                    nombre = ?, 
                    precio = ?, 
                    descripcion = ?, 
                    stock = ?, 
                    imagen = ? 
                WHERE id = ?
            `;
            const values = [
                req.body.id_categoria,
                req.body.nombre,
                req.body.precio,
                req.body.descripcion,
                req.body.stock,
                req.body.imagen,
                req.body.id // Agregar el ID al final del array de valores
            ];
            const [rows] = await connection.query(sql, values); 
            connection.release();
            res.send('Producto actualizado correctamente.'); 
        }else{
            const sql = `
                INSERT INTO productos (id_categoria, nombre, precio, descripcion, stock, imagen) 
                VALUES (?, ?, ?, ?, ?, ?)
            `;
            const values = [
                req.body.id_categoria,
                req.body.nombre,
                req.body.precio,
                req.body.descripcion,
                req.body.stock,
                req.body.imagen
            ];
            const [result] = await connection.query(sql, values); 
            connection.release();
            res.send("Producto agregado");
        }
    }catch(err){
        console.error('Se produjo un error al intentar cargar el producto:', err); 
        res.status(500).send('Error al intentar cargar el producto'); 
    }
    console.log(req.body);
}; 

const verProducto = async (req, res)=>{
    const id = parseInt(req.params.id); 
    try {
        const connection = await pool.getConnection();
        const sql = 'SELECT productos.nombre, productos.precio, productos.descripcion, productos.stock, productos.imagen, productos.id, categorias.id AS categoria FROM productos JOIN categorias ON productos.id_categoria = categorias.id WHERE productos.id = ?';
        const [rows] = await connection.query(sql, [id]);
        connection.release();
        res.json(rows[0]);
    } catch (error) {
        console.error('Hubo un error al obtener los productos:', error);
        res.status(500).send('Error, producto no encontrado'); 
    }
};

const deleteProdcutos = async (req, res)=>{
    const id = parseInt(req.params.id); 
    console.log(id);
    try {
        const connection = await pool.getConnection();
        const sql = 'DELETE FROM productos WHERE id = ?';
        const [rows] = await connection.query(sql, [id]);
        connection.release();
        if (rows.affectedRows > 0) {
            res.json({ success: true, message: 'Producto borrado' });
        } else {
            res.status(404).json({ success: false, message: 'Producto no encontrado' });
        }
    } catch (error) {
        console.error('Hubo un error al obtener los productos:', error);
        res.status(500).json({ success: false, message: 'Error al intentar borrar el producto' }); 
    }
}; 

module.exports = {
    obtenerProductos,
    crearProductos,
    verProducto, 
    deleteProdcutos
}