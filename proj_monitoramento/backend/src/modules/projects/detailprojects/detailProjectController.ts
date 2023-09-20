import { Request,Response } from "express"
import { detailProjectService } from "./detailProjectService";

class detailProjectController{
    async handle(req: Request, res: Response){
        
        const project_id = req.query.project_id as string;

        const detailprojectservice = new detailProjectService();

        const project = await detailprojectservice.execute(project_id);

        return res.json(project);
    }
}
export {detailProjectController}