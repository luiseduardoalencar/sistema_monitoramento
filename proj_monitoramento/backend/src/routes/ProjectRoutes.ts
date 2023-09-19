// ProjectsRoutes.ts
import { Router } from "express";
import { CreateProjectController, ListByStatusController, isAuthenticated, isAdmin } from "./routesimports";

const projectsRouter = Router();

// Rota para criar um projeto (requer autenticação e privilégios de administrador)
projectsRouter.post('/create', isAuthenticated, isAdmin, new CreateProjectController().handle);

// Rota para listar projetos por status (requer autenticação)
projectsRouter.get('/status', isAuthenticated, new ListByStatusController().handle);

export { projectsRouter };
