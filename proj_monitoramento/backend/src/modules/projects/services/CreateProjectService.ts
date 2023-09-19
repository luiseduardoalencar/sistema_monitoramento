import prismaClient from "../../../prisma";


class CreateProjectService{



    async execute({cod_municipio,
        ano_exec,nome_projeto, status,data_inicio,prazo_exec,cod_unico,cod_cnae_secao,cod_cnae_divisao,nome_alimentador,cpf_alimentador, cnpj_alimentador,nome_fiscal,cpf_fiscal,cnpj_fiscal,
        exec_projeto,justificativa,canal_comunicacao,orcamento,previsao_de_custo,acoes,atividades,subatividades,tarefas}:IProjectRequestDTO){


        const projectAlreadyExists = await prismaClient.projetos.findFirst({
            where:{
                cod_unico: cod_unico
            }
        })
        if (projectAlreadyExists){
            throw new Error("Project already exists");
        }


            const project = await prismaClient.projetos.create({ 
                data:{    
                    cod_municipio,
                    ano_exec,
                    nome_projeto, 
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
                        }, select:{
                            id_projeto: true,
                            nome_projeto: true,
                            nome_alimentador: true,
                            nome_fiscal : true,
                            cod_unico: true,    
                        }
                    })
            return project
        }
        }

export {CreateProjectService}