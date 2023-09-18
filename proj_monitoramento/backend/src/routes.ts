import { Router } from "express";
import { CreateProjectController } from "./modules/projects/controllers/CreateProjectController";
import { CreateUserAdminController } from "./modules/user/submodules/user_Admin/create/CreateUserAdminController";
import { CreateUserFiscalController } from "./modules/user/submodules/user_Fiscal/create/CreateUserFiscalController";
import { CreateUserAlimentadorController } from "./modules/user/submodules/user_Alimentador/create/CreateUserAlimentadorController";
import { AuthUserAdminController } from "./modules/user/submodules/user_Admin/authenticate/AuthUserAdminController";
import { AuthUserAlimentadorController } from "./modules/user/submodules/user_Alimentador/authenticate/AuthUserAlimentadorController";
import { AuthUserFiscalController } from "./modules/user/submodules/user_Fiscal/authenticate/AuthUserFiscalController";
import { isAuthenticated } from "./middlewares/isAuthenticated";
import { DetailUserAdminController } from "./modules/user/submodules/user_Admin/detail/DetailUserAdminController";
import { DetailUserAlimentadorController } from "./modules/user/submodules/user_Alimentador/detail/DetailUserAlimentadorController";
import { DetailUserFiscalController } from "./modules/user/submodules/user_Fiscal/detail/DetailUserFiscalController";
const router = Router();

//--ROTAS USER--//
router.post('/user_admin',new CreateUserAdminController().handle)
router.post('/session_admin',new AuthUserAdminController().handle)
router.get('/user_info_admin',isAuthenticated,new DetailUserAdminController().handle)

router.post('/user_fiscal',new CreateUserFiscalController().handle)
router.post('/session_fiscal',new AuthUserFiscalController().handle)
router.get('/user_info_fiscal',isAuthenticated,new DetailUserFiscalController().handle)

router.post('/user_alimentador',new CreateUserAlimentadorController().handle)
router.post('/session_alimentador',new AuthUserAlimentadorController().handle)
router.get('/user_info_alimentador',isAuthenticated,new DetailUserAlimentadorController().handle)




//--Rotas Produtos--//
router.post('/projects',isAuthenticated,new CreateProjectController().handle)


export {router}