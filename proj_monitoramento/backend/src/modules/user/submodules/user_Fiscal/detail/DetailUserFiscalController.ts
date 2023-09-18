import { Request,Response } from "express";
import { DetailUserFiscalService } from "./DetailUserFiscalService";

class DetailUserFiscalController{
    async handle(req: Request, res: Response){
        
        const user_id = req.user_id;

        const detailuserservice= new DetailUserFiscalService();
        
        const user = await detailuserservice.execute(user_id);
        
        return res.json(user);
    }
}
export {DetailUserFiscalController}