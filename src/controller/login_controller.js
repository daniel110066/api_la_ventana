import { JWT_KEY } from '../config';
import jwt from 'jsonwebtoken'
import pool from '../db-config';

export async function getToken(req, res) {
    if (req.body.usuario_admin && req.body.clave_admin) {
        const usuario_admin = req.body.usuario_admin;
        const clave_admin = req.body.clave_admin;
        let token = '';
        const sql = `SELECT super_admin FROM Admins WHERE usuario_admin = ? AND clave_admin = SHA2(?, 224)`;
        const [list] = await pool.query(sql, [user, user, password]);
        console.log(list);
        if (list[0]) {
            const payload = {
                usuario: usuario_admin,
                superAdmin: list[0].super_admin
            };
            token = jwt.sign(payload, JWT_KEY, { expiresIn: 7200 });

            res.status(200).json({
                mensaje: 'usuario autenticado',
                token: token,
            });
        } else {
            res.status(403).json({
                mensaje: 'Usuario no autenticado',
                token: token
            });
        }
    } else {
        res.status(401).json({ mensaje: "faltan datos datos" });
    }
}

