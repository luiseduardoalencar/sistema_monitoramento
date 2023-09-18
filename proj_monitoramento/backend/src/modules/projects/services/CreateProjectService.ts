import prismaClient from "../../../prisma";


class CreateProjectService{
    async execute({nome_projeto, data_inicio,prazo_exec, cod_unico,cod_cnae_secao,cod_cnae_divisao,ag_alimentador_nome,ag_alimentador_cpf,ag_alimentador_cnpj,ag_fiscal_nome,ag_fiscal_cpf,ag_fiscal_cnpj,
        exec_projeto,justificativa,canal_comunicacao,orcamento,previsao_de_custo,acoes,atividades,subatividades,tarefas}:IProjectRequestDTO){
        
            const project = await prismaClient.projetos.create({ 
                data:{
                    nome_projeto, data_inicio,prazo_exec, cod_unico,cod_cnae_secao,cod_cnae_divisao,ag_alimentador_nome,ag_alimentador_cpf,ag_alimentador_cnpj,ag_fiscal_nome,ag_fiscal_cpf,ag_fiscal_cnpj,
                    exec_projeto,justificativa,canal_comunicacao,orcamento,previsao_de_custo,acoes,atividades,subatividades,tarefas
                }
            })
            return project
        }
        }

export {CreateProjectService}