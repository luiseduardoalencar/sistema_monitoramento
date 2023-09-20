import { Request, Response } from "express";
import { createAcompanhamentoService } from "./createAcompanhamentoService";

class createAcompanhamentoController{
    async handle(req: Request, res: Response){
        const {id_projeto, 
            nome_projeto, 
            nome_alimentador, 
            nome_fiscal,
            cod_unico,
            data_inicio,
            prazo_exec} = req.body

        const createacompanhamentoservice = new createAcompanhamentoService();

        const acompanhamento = await createacompanhamentoservice.execute({
            id_projeto,
            nome_projeto,
            nome_alimentador, 
            nome_fiscal,
            cod_unico,
            data_inicio,
            prazo_exec
        })

        return res.json(acompanhamento);
}
}

export {createAcompanhamentoController}