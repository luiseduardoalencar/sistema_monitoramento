import { Request,Response } from "express";
import { DetailUserAdminService } from "./DetailUserAdminService";

class DetailUserAdminController{
    async handle(req: Request, res: Response){
        
        const user_id = req.user_id;

        const detailuserservice= new DetailUserAdminService();
        
        const user = await detailuserservice.execute(user_id);
        
        return res.json(user);
    }
}
export {DetailUserAdminController}