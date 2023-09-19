import prismaClient from "../../../../../prisma";
import { compare } from "bcryptjs";
import {sign} from "jsonwebtoken";

interface AuthRequest{
    cpf: string;
    password: string;
}
class AuthUserAdminService{
    async execute({cpf,password}:AuthRequest){

        const user = await prismaClient.user_admin.findFirst({
            where:{
                cpf_admin:cpf
            }
        })
        if(!user){
            throw new Error("User not exists");
        }
        

        //verificar se a senha é valida
        const passwordMatch = await compare(password, user.password);
        if(!passwordMatch){
            throw new Error("Email/Password incorrect");
        }


        //gerar um token JWT e devolver o dados do usuario
        const token = sign(
            {
            cpf: user.cpf_admin, 
            nome:user.nome_admin,
            role: 'admin'
            },
            process.env.JWT_SECRET,
            {
                subject: user.id_admin,
                expiresIn: "1d"
            }
        )


        return {
            id: user.id_admin,
            name: user.nome_admin,
            token: token
        }
    }
}
export {AuthUserAdminService}