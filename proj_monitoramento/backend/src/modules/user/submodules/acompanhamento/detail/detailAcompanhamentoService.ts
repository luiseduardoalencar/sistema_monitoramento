import prismaClient from "../../../../../prisma";

class detailAcompanhamentoService{

    async execute(id_acompanhamento: string){
        const acompanhamento = await prismaClient.acompanhamento.findFirst({
            where:{
                id_acompanhamento: id_acompanhamento
            },
            select:{
                id_projeto:true,
                nome_projeto:true,
                nome_alimentador:true,
                nome_fiscal:true,
                cod_unico: true,
                data_inicio: true,
                prazo_exec: true,
            },
    
        })
        return acompanhamento;
    }
}
export {detailAcompanhamentoService}