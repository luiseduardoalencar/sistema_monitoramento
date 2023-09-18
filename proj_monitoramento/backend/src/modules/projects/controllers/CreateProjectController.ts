import { Request,Response } from "express";
import { CreateProjectService } from "../services/CreateProjectService";    

class CreateProjectController{
    async handle(req: Request, res: Response){
        const {nome_projeto, data_inicio,prazo_exec, cod_unico,cod_cnae_secao,cod_cnae_divisao,ag_alimentador_nome,ag_alimentador_cpf,ag_alimentador_cnpj,ag_fiscal_nome,ag_fiscal_cpf,ag_fiscal_cnpj,
            exec_projeto,justificativa,canal_comunicacao,orcamento,previsao_de_custo,acoes,atividades,subatividades,tarefas} = req.body


        const createprojectservice = new CreateProjectService();

        const project = await createprojectservice.execute({
            nome_projeto, data_inicio,prazo_exec, cod_unico,cod_cnae_secao,cod_cnae_divisao,ag_alimentador_nome,ag_alimentador_cpf,ag_alimentador_cnpj,ag_fiscal_nome,ag_fiscal_cpf,ag_fiscal_cnpj,
            exec_projeto,justificativa,canal_comunicacao,orcamento,previsao_de_custo,acoes,atividades,subatividades,tarefas
        });

        return res.json(project);
    }
}
export {CreateProjectController}


    