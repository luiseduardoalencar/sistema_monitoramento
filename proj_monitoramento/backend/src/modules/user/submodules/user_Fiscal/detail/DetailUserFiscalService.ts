import prismaClient from "../../../../../prisma";

class DetailUserFiscalService{
    async execute(user_id: string){

        const user = await prismaClient.user_fiscal.findFirst({
            where:{
                id_fiscal: user_id
            },
            select:{
                id_fiscal: true,
                nome_fiscal: true,
                nome_orgao: true,
                nome_empresa: true,
                num_contrato: true,
                unidade_sei: true,
            }
        })
        return user;
    }
}
export {DetailUserFiscalService}