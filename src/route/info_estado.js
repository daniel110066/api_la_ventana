import { Router } from "express";
import pool from '../db-config.js';

const router = Router();

const getInfoEstado = async(req,res) => {
    const sql = `SELECT * FROM InfoEstados WHERE lower(nombre_estado) = lower(?)`; 
    const [estadoData] = await pool.query(sql,[req.params.estado]);
    if(estadoData[0]){
        res.status(200).json({
            mensaje: `Datos del estado --> ${req.params.estado}`,
            id_estado: estadoData[0].id_estado,
            nombre_estado: estadoData[0].nombre_estado,
            info_estado: estadoData[0].info_estado,
            escudo_estado: estadoData[0].escudo_estado,
            imagen_estado: estadoData[0].imagen_estado,
        });
    }else{
        res.status(404).json({
            mensaje: 'el estado solicitado no existe'
        });
    }
    
}

const getInfoEstados = async(req,res) => {
    const sql = `SELECT * FROM InfoEstados`; 
    const [estadoData] = await pool.query(sql);
    if(estadoData[0]){
        res.status(201).json({
            mensaje: "Datos de todos los estados",
            info_estados: estadoData
        });
    }else{
        res.status(404).json({
            mensaje: 'La tabla InfoEstados esta vacia'
        });
    }
    
}

router.get('/:estado', getInfoEstado); 
router.get('/', getInfoEstados); 

export default router;