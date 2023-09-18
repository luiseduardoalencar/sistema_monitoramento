import { Request, Response } from "express";
import { AuthUserAdminService } from "./AuthUserAdminService";

class AuthUserAdminController{
    async handle(req: Request, res: Response){
        const {cpf, password} = req.body;
        const authUserAdminService = new AuthUserAdminService();
        const auth = await authUserAdminService.execute({cpf, password});

        return res.json(auth);
    }
}

export {AuthUserAdminController}