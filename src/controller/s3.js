import util from 'util'
import { exec } from 'child_process';
import { BUCKET_URI, BUCKET_URL } from '../config.js';

// Convierte exec en una función que devuelve una promesa
const execAsync = util.promisify(exec);

async function cmd(comando) {
  try {
    const { stdout, stderr } = await execAsync(comando);
    console.log(`Salida estándar: ${stdout}`);
    
    if (stderr) {
      console.error(`Error en la salida estándar de error: ${stderr}`);
    }
  } catch (error) {
    console.error(`Error al ejecutar el comando: ${error.message}`);
    throw error; // Lanza la excepción nuevamente para que la función que llama pueda manejarla
  }
}

export async function uploadFile(file) {
  if (file) {
    const path = file.tempFilePath;
    const name = file.name;

    try {
      await cmd(`mv ./${path} ./uploads/${name}`);
      await cmd(`aws s3 cp ./uploads/${name} ${BUCKET_URI}`);
      await cmd(`rm ./uploads/${name}`);
      return `${BUCKET_URL}${name}`;
    } catch (error) {
      console.error(`Error en la función uploadFile: ${error.message}`);
      return null; // Retorna null en caso de error
    }
  } else {
    return null;
  }
}

export async function deleteFile(URL){
  const URI = `${BUCKET_URI}${URL.slice(BUCKET_URL.length)}`
  try{
    await cmd(`aws s3 rm ${URI}`);
  } catch (error) {
    console.error(`Error en la función uploadFile: ${error.message}`);
  }
  
}




