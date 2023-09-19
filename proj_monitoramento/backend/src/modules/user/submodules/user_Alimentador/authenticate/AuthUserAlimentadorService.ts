import prismaClient from "../../../../../prisma";
import { compare } from "bcryptjs";
import {sign} from "jsonwebtoken";

interface AuthRequest{
    cpf: string;
    password: string;
}
class AuthUserAlimentadorService{
    async execute({cpf,password}:AuthRequest){

        const user = await prismaClient.user_alimentador.findFirst({
            where:{
                cpf_alimentador:cpf
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
            cpf: user.cpf_alimentador, 
            nome:user.nome_alimentador,
            role: 'alimentador'
            },
            process.env.JWT_SECRET,
            {
                subject: user.id_alimentador,
                expiresIn: "1d"
            }
        )


        return {
            id: user.id_alimentador,
            name: user.nome_alimentador,
            token: token
        }
    }
}
export {AuthUserAlimentadorService}