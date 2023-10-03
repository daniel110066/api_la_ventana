import { Router } from "express";
import { deleteFile, uploadFile } from "../controller/s3.js";
import pool from '../db-config.js'

const router = Router();

const getProyecto = async(req,res) => {
    const sql = `SELECT * FROM Proyectos WHERE lower(nombre_proyecto) = lower(?) or id_proyecto = ?; `; 
    const [proyecto] = await pool.query(sql,[req.params.id_or_name,req.params.id_or_name]);
    if(proyecto[0]){
        res.status(200).json({
            mensaje: `Datos del Proyecto --> ${req.params.id_or_name}`,
            proyecto: proyecto[0]
        });
    }else{
        res.status(404).json({
            mensaje: 'el proyecto solicitado no existe'
        });
    }
}
const getProyectos = async(req,res) => {
    const sql = `SELECT * FROM Proyectos`; 
    const [proyecto] = await pool.query(sql);
    if(proyecto[0]){
        res.status(200).json({
            mensaje: `Todos los proyectos`,
            proyectos: proyecto
        });
    }else{
        res.status(404).json({
            mensaje: 'La tabla Proyectos esta vacia'
        });
    }
}
const postProyecto = async(req,res) => {
    if(req.body.nombre_proyecto && req.body.categoria_proyecto && req.body.descripcion_proyecto && req.body.tipo_proyecto && req.body.estado && req.body.latitud && req.body.longitud){
        const nombre_proyecto = req.body.nombre_proyecto
        const categoria_proyecto = req.body.categoria_proyecto
        const descripcion_proyecto = req.body.descripcion_proyecto
        const url_proyecto = req.body.url_proyecto
        const tipo_proyecto = req.body.tipo_proyecto
        const estado = req.body.estado
        const latitud = req.body.latitud
        const longitud = req.body.longitud

        
        const [validName] = await pool.query(
            `SELECT NOT EXISTS(SELECT 1 FROM Proyectos WHERE lower(nombre_proyecto) = lower(?)) AS proyecto_disponible`,
            [nombre_proyecto]
        )
        if(validName[0].proyecto_disponible){
            if(req.files){
                var logo_proyecto = req.files.logo
                var imagen_proyecto = req.files.imagen
                if(logo_proyecto){ logo_proyecto = await uploadFile(logo_proyecto)}
                if(imagen_proyecto){ imagen_proyecto = await uploadFile(imagen_proyecto)}
            }
            const sql = `INSERT INTO Proyectos values(0,?,?,?,?,?,?,?,?,?,?)`; 
            try {
                const [rows,fields] = await pool.query(sql,[nombre_proyecto,categoria_proyecto,descripcion_proyecto,url_proyecto,logo_proyecto,imagen_proyecto,tipo_proyecto,estado,latitud,longitud]);
            if (rows.affectedRows === 1) {
                res.status(200).json({
                    mensaje: `proyecto agregado`,
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
            res.status(406).json({
                mensaje: `El proyecto -${nombre_proyecto}- ya existe`,
            });
        }
    }else{
        res.status(422).json({
            mensaje: `Faltan datos para crear el proyecto`,
        });
    }
}
const putProyecto = async(req,res) => {
    const [img] = await pool.query(`select logo_proyecto, imagen_proyecto from Proyectos where id_proyecto = ?`, req.params.id_proyecto);
    const [proyecto] = await pool.query(`SELECT * FROM Proyectos WHERE id_proyecto = ?; `,[req.params.id_proyecto]);
    if(proyecto[0]){
        const id_proyecto = req.params.id_proyecto;
        var mensaje = `Proyecto --> ${id_proyecto} modificado`;
        if(req.body.nombre_proyecto){
            const nombre_proyecto = req.body.nombre_proyecto
            const [validName] = await pool.query(
                `SELECT NOT EXISTS(SELECT 1 FROM Proyectos WHERE lower(nombre_proyecto) = lower(?)) AS proyecto_disponible`,
                [nombre_proyecto]
            )
            if(validName[0].proyecto_disponible){
                await pool.query(`UPDATE Proyectos SET nombre_proyecto = ? WHERE id_proyecto = ?`,[nombre_proyecto,id_proyecto])
            }else{
                mensaje = "Nombre no disponible"
            }
        }
        if(req.body.categoria_proyecto){
            const categoria_proyecto = req.body.categoria_proyecto
            await pool.query(`UPDATE Proyectos SET categoria_proyecto = ? WHERE id_proyecto = ?`,[categoria_proyecto,id_proyecto])
        }
        if(req.body.descripcion_proyecto){
            const descripcion_proyecto = req.body.descripcion_proyecto
            await pool.query(`UPDATE Proyectos SET descripcion_proyecto = ? WHERE id_proyecto = ?`,[descripcion_proyecto,id_proyecto])
        }
        if(req.body.url_proyecto){
            const url_proyecto = req.body.url_proyecto
            await pool.query(`UPDATE Proyectos SET url_proyecto = ? WHERE id_proyecto = ?`,[url_proyecto,id_proyecto])
        }
        if(req.files.logo){
                var logo_proyecto = img[0].logo_proyecto
                if(logo_proyecto){ await deleteFile(logo_proyecto)}
                    logo_proyecto = await uploadFile(req.files.logo)
                await pool.query(`UPDATE Proyectos SET logo_proyecto = ? WHERE id_proyecto = ?`,[logo_proyecto,id_proyecto])
        }
        if(req.files.imagen){
                var imagen_proyecto = img[0].imagen_proyecto
                if(imagen_proyecto){await deleteFile(imagen_proyecto)}
                imagen_proyecto = await uploadFile(req.files.imagen)
                await pool.query(`UPDATE Proyectos SET imagen_proyecto = ? WHERE id_proyecto = ?`,[imagen_proyecto,id_proyecto])
            
            
        }else{console.log("no imagen")}
        if(req.body.tipo_proyecto){
            const tipo_proyecto = req.body.tipo_proyecto
            await pool.query(`UPDATE Proyectos SET tipo_proyecto = ? WHERE id_proyecto = ?`,[tipo_proyecto,id_proyecto])
        }
        if(req.body.estado){
            const estado = req.body.estado
            await pool.query(`UPDATE Proyectos SET estado = ? WHERE id_proyecto = ?`,[estado,id_proyecto])
        }
        if(req.body.latitud){
            const latitud = req.body.latitud
            await pool.query(`UPDATE Proyectos SET latitud = ? WHERE id_proyecto = ?`,[latitud,id_proyecto])
        }
        if(req.body.longitud){
            const longitud = req.body.longitud
            await pool.query(`UPDATE Proyectos SET longitud = ? WHERE id_proyecto = ?`,[longitud,id_proyecto])
        }
        res.status(200).json({
            mensaje: mensaje
        });
    }else{
        res.status(404).json({
            mensaje: 'el proyecto a modificar no existe'
        });
    }
}
const deleteProyecto = async(req,res) => {
    const [img] = await pool.query(`select logo_proyecto, imagen_proyecto from Proyectos where id_proyecto = ?`, req.params.id_proyecto);
        if(img[0]){
            const logo_proyecto = img[0].logo_proyecto
            const imagen_proyecto = img[0].imagen_proyecto
            if(logo_proyecto){ await deleteFile(logo_proyecto)}
            if(imagen_proyecto){await deleteFile(imagen_proyecto)}
        }
    const sql = `delete FROM Proyectos WHERE id_proyecto = ?`; 
    const [rows, fields] = await pool.query(sql,[req.params.id_proyecto]);
        res.status(200).json({
            mensaje: `Proyecto --> ${req.params.id_proyecto} eliminado, filas afectadas = ${rows.affectedRows}`
        });
}

router.get("/:id_or_name", getProyecto);
router.get("/", getProyectos);
router.post("/", postProyecto);
router.put("/:id_proyecto", putProyecto);
router.delete("/:id_proyecto", deleteProyecto);
export default router;