const pool = require('../db/db'); 
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt'); 
const cookieParser = require('cookie-parser'); 
require('dotenv').config(); 
//const bcrypt = require('bcrypt'); 

const crearUsuario = async (req, res) =>{
    console.log(req.body);
    const {name, email, password, passwordConfirm} = req.body; 
    const rol = 1; // cambio admin 1 o user por 2 usuario
    console.log(name, email, password, passwordConfirm, rol);
    try{    
        const hashedPassword = await bcrypt.hash(password, 10);
        const connection = await pool.getConnection();
        const sql = `
                INSERT INTO usuarios (nombre, email, password, rol) 
                VALUES (?, ?, ?, ?)
            `;
        const values = [name, email, hashedPassword, rol]; 
        const [rows] = await connection.query(sql, values); 
        connection.release(); 
        res.status(200).json({success: true, messaage: 'Usuario registrado correctamente'}); 
    }catch(error){
        console.error('Se produjo un error al intentar cargar el usuario:', error); 
        res.status(500).json({success: false, message: 'Error al intentar registrar el usuario'});
    }
}

const loginUsuario = async (req, res) =>{
    const {email, password} = req.body; 
    const secretKey = process.env.SECRET_KEY; 

    try{
        const connection = await pool.getConnection();
        sql = `SELECT * FROM usuarios WHERE email = ?`; 
        const [rows] = await connection.query(sql, email); 

        // Verificar si el usuario existe
        if (rows.length === 0) {
            return res.status(401).json({ success: false, message: 'Usuario o contraseña incorrectos' });
        }

        const user = rows[0]; 

        const isMatch = await bcrypt.compare(password, user.password); 
        if (!isMatch){
            return res.status(401).json({ success: false, message: `Usuario o contraseña incorrectos ${password}, ${user.password}` });
        }

        // Crear un token JWT
        const token = jwt.sign({ role: user.rol, email: user.email, name: user.nombre }, secretKey, {
            expiresIn: '1h' // El token expira en 1 hora
        });
        res.cookie('token', token, 
            {
                httpOnly: true, 
                expires: new Date(Date.now()+ 3600000)
            }).redirect('/admin') 
        // Enviar el token al cliente
        //res.json({ success: true, token });

         connection.release();
         
    }catch(error){
        console.error('Se produjo un error al intentar loguear el usuario:', error); 
        res.status(500).json({success: false, message: 'Error al intentar loguearse'});
    }
    
}

module.exports = {
    crearUsuario,
    loginUsuario
}