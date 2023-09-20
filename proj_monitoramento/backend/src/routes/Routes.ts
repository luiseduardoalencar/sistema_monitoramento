
import { Router } from "express";
import { usersRouter } from "./user.routes"; 
import { projectsRouter } from "./project.routes"; 
import { acompanhamentosRouter } from "./acompanhamentos.routes";

const router = Router();

router.use('/users', usersRouter);

router.use('/projetos', projectsRouter);

router.use('/acompanhamentos', acompanhamentosRouter);

export { router };

