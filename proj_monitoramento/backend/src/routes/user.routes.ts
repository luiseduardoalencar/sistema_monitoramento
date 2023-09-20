import { Router } from "express";
import {
  CreateUserAdminController,
  AuthUserAdminController,
  DetailUserAdminController,
  UpdateUserAdminController,
  CreateUserFiscalController,
  AuthUserFiscalController,
  DetailUserFiscalController,
  UpdateUserFiscalController,
  CreateUserAlimentadorController,
  AuthUserAlimentadorController,
  DetailUserAlimentadorController,
  UpdateUserAlimentadorController,
  isAuthenticated,
  isAdmin,
  isFiscal,
  isAlimentador,
} from "./RoutesImports";

const usersRouter = Router();

// Rotas para usuário admin
usersRouter.post('/admin/cadastro', new CreateUserAdminController().handle);
usersRouter.post('/admin/login', new AuthUserAdminController().handle);
usersRouter.get('/admin/info', isAuthenticated, isAdmin, new DetailUserAdminController().handle);
usersRouter.patch('/admin/update', isAuthenticated, isAdmin, new UpdateUserAdminController().handle);

// Rotas para usuário fiscal
usersRouter.post('/fiscal/cadastro', new CreateUserFiscalController().handle);
usersRouter.post('/fiscal/login', new AuthUserFiscalController().handle);
usersRouter.get('/fiscal/info', isAuthenticated, isFiscal, new DetailUserFiscalController().handle);
usersRouter.patch('/fiscal/update', isAuthenticated, isFiscal, new UpdateUserFiscalController().handle);

// Rotas para usuário alimentador
usersRouter.post('/alimentador/cadastro', new CreateUserAlimentadorController().handle);
usersRouter.post('/alimentador/login', new AuthUserAlimentadorController().handle);
usersRouter.get('/alimentador/info', isAuthenticated, isAlimentador, new DetailUserAlimentadorController().handle);
usersRouter.patch('/alimentador/update', isAuthenticated, isAlimentador, new UpdateUserAlimentadorController().handle);

export { usersRouter };

