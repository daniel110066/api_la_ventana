import express  from "express";
import cors from "cors";
import multer from "multer";
import info_estado from "./route/info_estado.js"
import proyecto from './route/proyecto.js'

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(multer().array());
app.use(express.json());

app.use('/info_estado',info_estado); //get
app.use('/proyecto',proyecto); //get | put | post | delete

app.listen (port, () => {
    console.log(`servidor iniciado en el puerto ${port}`)
});


