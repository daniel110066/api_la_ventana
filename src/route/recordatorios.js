import { Router } from "express";
import pool from '../db-config.js';

const router = Router();

const getRecordatorios = async(req,res) => {
    const sql = `SELECT * FROM Recordatorios`; 
    const [recordatoriosData] = await pool.query(sql);
    if(recordatoriosData[0]){
        res.status(200).json({
            recordatorios: recordatoriosData
        });
    }else{
        res.status(404).json({
            mensaje: 'no hay recordatorios'
        });
    }
    
}

const postRecordatorios = async(req,res) => {
    if(req.body.nombre_recordatorio, req.body.info_recordatorio, req.body.categoria_recordatorio){
        const nombre_recordatorio = req.body.nombre_recordatorio;
        const info_recordatorio = req.body.info_recordatorio;
        const categoria_recordatorio = req.body.categoria_recordatorio;
        const sql = `insert into Recordatorios values (0,?,?,?)`;
        try {
            const [rows,fields] = await pool.query(sql,[nombre_recordatorio,info_recordatorio,categoria_recordatorio]);
        if (rows.affectedRows === 1) {
            res.status(200).json({
                mensaje: `recordatotio agregado`,
            });
          } else {
            res.status(200).json({
                mensaje: `nada cambio`,
            });
          }
        } catch (error) {
            res.status(200).json({
                mensaje: `Fallo al agregar`,
                error: error,
            });
            console.error('Error:', error);
        }
    }else{
        res.status(404).json({
            mensaje: 'faltan datos para insertar'
        });
    }
    
}

router.get('/', getRecordatorios); 
router.post('/', postRecordatorios); 

export default router;