import { Router } from "express";
import { getToken } from "../controller/login_controller.js";

const router = Router();

router.post('/', getToken);

export default router;