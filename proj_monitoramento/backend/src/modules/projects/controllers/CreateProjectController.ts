import { Request,Response } from "express";
import { CreateProjectService } from "../services/CreateProjectService";    

class CreateProjectController{
    async handle(req: Request, res: Response){
        const {nome_projeto,
            cod_municipio,
            ano_exec,
            status, 
            data_inicio,
            prazo_exec,
            cod_unico,
            cod_cnae_secao,
            cod_cnae_divisao,
            nome_alimentador,
            cpf_alimentador, 
            cnpj_alimentador,
            nome_fiscal,
            cpf_fiscal,
            cnpj_fiscal,
            exec_projeto,
            justificativa,
            canal_comunicacao,
            orcamento,
            previsao_de_custo,
            acoes,
            atividades,
            subatividades,
            tarefas} = req.body


        const createprojectservice = new CreateProjectService();

        const project = await createprojectservice.execute({
            nome_projeto, 
            cod_municipio,
            ano_exec,
            status,
            data_inicio,
            prazo_exec,
            cod_unico,
            cod_cnae_secao,
            cod_cnae_divisao,
            nome_alimentador,
            cpf_alimentador, 
            cnpj_alimentador,
            nome_fiscal,
            cpf_fiscal,
            cnpj_fiscal,
            exec_projeto,
            justificativa,
            canal_comunicacao,
            orcamento,
            previsao_de_custo,
            acoes,
            atividades,
            subatividades,
            tarefas
        });

        return res.json(project);
    }
}
export {CreateProjectController}


    