import prismaClient from "../../../../../prisma";

class createAcompanhamentoService{

    async execute({
        id_projeto, 
        nome_projeto, 
        nome_alimentador, 
        nome_fiscal,
        cod_unico,
        data_inicio,
        prazo_exec}:ICreateAcompanhamentoDTO){
        
        const acompanhamentoalreadyExists = await prismaClient.acompanhamento.findFirst({   
            where:{
                cod_unico: cod_unico
            }
        })

        if(acompanhamentoalreadyExists){
            throw new Error("Acompanhamento already exists");
        }

        const acompanhamento = await prismaClient.acompanhamento.create({   
            data:{
                id_projeto,
                nome_projeto,
                nome_alimentador,
                nome_fiscal,
                cod_unico,
                data_inicio,
                prazo_exec
            }
        })

        return acompanhamento
    }

}
export {createAcompanhamentoService}