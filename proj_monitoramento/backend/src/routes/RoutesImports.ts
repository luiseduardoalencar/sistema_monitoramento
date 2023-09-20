import { Router } from "express";
import { CreateProjectController } from "../modules/projects/create/CreateProjectController";
import { CreateUserAdminController } from "../modules/user/submodules/user_Admin/create/CreateUserAdminController";
import { CreateUserFiscalController } from "../modules/user/submodules/user_Fiscal/create/CreateUserFiscalController";
import { CreateUserAlimentadorController } from "../modules/user/submodules/user_Alimentador/create/CreateUserAlimentadorController";
import { AuthUserAdminController } from "../modules/user/submodules/user_Admin/authenticate/AuthUserAdminController";
import { AuthUserAlimentadorController } from "../modules/user/submodules/user_Alimentador/authenticate/AuthUserAlimentadorController";
import { AuthUserFiscalController } from "../modules/user/submodules/user_Fiscal/authenticate/AuthUserFiscalController";
import { isAuthenticated } from "../middlewares/isAuthenticated";
import { DetailUserAdminController } from "../modules/user/submodules/user_Admin/detail/DetailUserAdminController";
import { DetailUserAlimentadorController } from "../modules/user/submodules/user_Alimentador/detail/DetailUserAlimentadorController";
import { DetailUserFiscalController } from "../modules/user/submodules/user_Fiscal/detail/DetailUserFiscalController";
import { ListByStatusController } from "../modules/projects/listbystatus/ListByStatusController";
import { isAdmin } from "../middlewares/isAuthenticated";
import { isFiscal } from "../middlewares/isAuthenticated";
import { isAlimentador } from "../middlewares/isAuthenticated";
import { UpdateUserAdminController } from "../modules/user/submodules/user_Admin/update/UpdateUserAdminController";
import { UpdateUserFiscalController } from "../modules/user/submodules/user_Fiscal/update/UpdateUserFiscalController";
import { UpdateUserAlimentadorController } from "../modules/user/submodules/user_Alimentador/update/UpdateUserAlimentadorController";
import { createAcompanhamentoController } from "../modules/user/submodules/acompanhamento/create/createAcompanhamentoController";
export {
    Router,
    CreateProjectController,
    CreateUserAdminController,
    CreateUserFiscalController,
    CreateUserAlimentadorController,
    AuthUserAdminController,
    AuthUserAlimentadorController,
    AuthUserFiscalController,
    isAuthenticated,
    DetailUserAdminController,
    DetailUserAlimentadorController,
    DetailUserFiscalController,
    ListByStatusController,
    isAdmin,
    isFiscal,
    isAlimentador,
    UpdateUserAdminController,
    UpdateUserFiscalController,
    UpdateUserAlimentadorController,
    createAcompanhamentoController
  };