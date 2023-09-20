import { Request,Response } from "express";
import { detailAcompanhamentoService } from "./detailAcompanhamentoService";

class detalAcompanhamentoController{

    async handle(req: Request, res: Response){
        
        const acompanhamento_id = req.acompanhamento_id
        
        const detailacompanhamentoService= new detailAcompanhamentoService();

        const acompanhamento = await detailacompanhamentoService.execute(acompanhamento_id);

        return res.json(acompanhamento);

    }

}
export {detalAcompanhamentoController}
