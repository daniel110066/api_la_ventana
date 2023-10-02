import { config} from "dotenv";

config();

export const DB_HOST = process.env.DB_HOST || "localhost";
export const DB_PORT = process.env.DB_PORT || 3306;
export const DB_DATABASE = process.env.DB_DATABASE || "la_ventana";
export const DB_USER = process.env.DB_USER || 'root';
export const DB_PASSWORD = process.env.DB_PASSWORD || 'rootPassword';
export const BUCKET_URI = process.env.BUCKET_URI
export const BUCKET_URL = process.env.BUCKET_URL
