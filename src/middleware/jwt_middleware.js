import jwt from "jsonwebtoken";
import { JWT_KEY } from "../config";
import express from "espress";

const middleware = express.Router();
middleware.use((req,res,next) => {
    const token = req.headers['x-access-token']
    console.log('validando token...')
    if(token){
        const decode = jwt.verify(token, JWT_KEY, (err, decoded) => {
            if(err)
                return res.status(403).json({mensaje: 'token invalido'})
            else{
                next()
                //si es necesario, se pueden establecer valores a req
                //para enviar información al path solicitado 
            }
                
    })
    }else{
    return res.status(401).send({mensaje: 'token no proporcionado'});
    }
})

export default middleware;