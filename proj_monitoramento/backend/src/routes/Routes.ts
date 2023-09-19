// routes.ts
import { Router } from "express";
import { usersRouter } from "./UserRoutes"; // Importe suas rotas de usuários
import { projectsRouter } from "./projectroutes"; // Importe as rotas de projetos

const router = Router();

router.use('/users', usersRouter);

router.use('/projetos', projectsRouter);

export { router };

