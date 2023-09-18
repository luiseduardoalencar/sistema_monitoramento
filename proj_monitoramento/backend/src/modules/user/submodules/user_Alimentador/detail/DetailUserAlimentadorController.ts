import { Request,Response } from "express";
import { DetailUserAlimentadorService } from "./DetailUserAlimentadorService";

class DetailUserAlimentadorController{
    async handle(req: Request, res: Response){
        
        const user_id = req.user_id;

        const detailuserservice= new DetailUserAlimentadorService();
        
        const user = await detailuserservice.execute(user_id);
        
        return res.json(user);
    }
}
export {DetailUserAlimentadorController}