import { Router } from "express";
import { createAcompanhamentoController, isAuthenticated } from "./RoutesImports";

const acompanhamentosRouter = Router();

acompanhamentosRouter.post('/create', isAuthenticated, new createAcompanhamentoController().handle);
acompanhamentosRouter.get('/detail/:id', isAuthenticated, new createAcompanhamentoController().handle); 

export { acompanhamentosRouter };