import { Request, Response } from "express";
import { AuthUserFiscalService } from "./AuthUserFiscalService";

class AuthUserFiscalController{
    async handle(req: Request, res: Response){
        const {cpf, password} = req.body;
        const authUserAdminService = new AuthUserFiscalService();
        const auth = await authUserAdminService.execute({cpf, password});

        return res.json(auth);
    }
}

export {AuthUserFiscalController}