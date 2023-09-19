import prismaClient from "../../../../../prisma";
import { compare } from "bcryptjs";
import {sign} from "jsonwebtoken";

interface AuthRequest{
    cpf: string;
    password: string;
}
class AuthUserFiscalService{
    async execute({cpf,password}:AuthRequest){

        const user = await prismaClient.user_fiscal.findFirst({
            where:{
                cpf_fiscal:cpf
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
            cpf: user.cpf_fiscal, 
            nome:user.nome_fiscal,
            role: 'fiscal'
            },
            process.env.JWT_SECRET,
            {
                subject: user.id_fiscal,
                expiresIn: "1d"
            }
        )


        return {
            id: user.id_fiscal,
            name: user.nome_fiscal,
            token: token
        }
    }
}
export {AuthUserFiscalService}