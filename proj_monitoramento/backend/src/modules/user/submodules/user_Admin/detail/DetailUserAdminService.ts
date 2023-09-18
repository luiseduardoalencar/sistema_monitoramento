import prismaClient from "../../../../../prisma";

class DetailUserAdminService{
    async execute(user_id: string){

        const user = await prismaClient.user_admin.findFirst({
            where:{
                id_admin: user_id
            },
            select:{
                id_admin: true,
                nome_admin: true,
                nome_orgao: true,
                nome_empresa: true,
                num_contrato: true,
                unidade_sei: true,
            }
        })
        return user;
    }
}
export {DetailUserAdminService}