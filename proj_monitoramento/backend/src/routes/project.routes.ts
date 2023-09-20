import { Router } from "express";
import { CreateProjectController, ListByStatusController, isAuthenticated, isAdmin } from "./RoutesImports";
import { detailProjectController } from "../modules/projects/detailprojects/detailProjectController";

const projectsRouter = Router();

projectsRouter.post('/create', isAuthenticated, isAdmin, new CreateProjectController().handle);

projectsRouter.get('/status', isAuthenticated, new ListByStatusController().handle);

projectsRouter.get('/detail', isAuthenticated, new detailProjectController().handle);

export { projectsRouter };
