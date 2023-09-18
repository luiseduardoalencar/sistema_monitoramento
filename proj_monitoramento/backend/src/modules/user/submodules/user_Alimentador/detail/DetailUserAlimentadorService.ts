import prismaClient from "../../../../../prisma";

class DetailUserAlimentadorService{
    async execute(user_id: string){

        const user = await prismaClient.user_alimentador.findFirst({
            where:{
                id_alimentador: user_id
            },
            select:{
                id_alimentador: true,
                nome_alimentador: true,
                nome_orgao: true,
                nome_empresa: true,
                num_contrato: true,
                unidade_sei: true,
            }
        }
        )
        return user;
    }
}
export {DetailUserAlimentadorService}