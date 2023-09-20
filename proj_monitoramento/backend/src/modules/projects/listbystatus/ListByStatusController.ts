import { Response, Request } from "express";
import { ListByStatusService } from "./ListByStatusService";

class ListByStatusController{
    async handle(req: Request, res: Response){
        
        const status = req.query.status as string;

        const listByStatusService = new ListByStatusService();

        const projects = await listByStatusService.execute({status});

        return res.json(projects);
    }
}
export {ListByStatusController}
