import express  from "express";
import fileUpload from "express-fileupload";
import cors from "cors";
//import multer from "multer";
import info_estado from "./route/info_estado.js";
import proyecto from './route/proyecto.js';
import bienvenida from './route/bienvenida.js';
import login from './route/login.js'
import recordatorios from "./route/recordatorios.js";


const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
//app.use(multer().array());
app.use(express.json());

app.use(fileUpload({
    useTempFiles: true,
    tempFileDir: './uploads'
}));

app.use('/',bienvenida); //get
app.use('/info_estado',info_estado); //get
app.use('/proyecto',proyecto); //get | put | post | delete
app.use('/login',login); //post
app.use('/recordatorios', recordatorios); //get | post

app.listen (port, () => {
    console.log(`servidor iniciado en el puerto ${port}`)
});



