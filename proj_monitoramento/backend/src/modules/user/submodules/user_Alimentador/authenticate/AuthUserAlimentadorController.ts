import { Request, Response } from "express";
import { AuthUserAlimentadorService } from "./AuthUserAlimentadorService";

class AuthUserAlimentadorController{
    async handle(req: Request, res: Response){
        const {cpf, password} = req.body;
        const authUserAdminService = new AuthUserAlimentadorService();
        const auth = await authUserAdminService.execute({cpf, password});

        return res.json(auth);
    }
}

export {AuthUserAlimentadorController}