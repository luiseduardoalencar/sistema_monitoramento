import { ICreateUserAlimentadorDTO } from "../../../Interfaces/ICreateUserAlimentadorDTO";
import  prismaClient from "../../../../../prisma";
import { hash } from "bcryptjs";
class CreateUserAlimentadorService{
async execute({nome_alimentador,nome_orgao,cargo,profissao,nivel_escolaridade, sexo,genero,cpf_alimentador,mat_orgao,unidade_sei,email_institucional,email_pessoal,cnpj_alimentador,nome_empresa,num_contrato,password}:ICreateUserAlimentadorDTO){

    if(!cpf_alimentador){
        throw new Error("CPF incorreto");
    }

    const userAlreadyExists = await prismaClient.user_alimentador.findFirst({
        where:{
            cpf_alimentador: cpf_alimentador
        }
    })
    if(userAlreadyExists){
        throw new Error("User already exists");
    }

    const passwordHash = await hash(password, 8);

    const user = await prismaClient.user_alimentador.create({
        data:{
            nome_alimentador,
            nome_orgao,
            cargo,
            profissao,
            nivel_escolaridade, 
            sexo,
            genero,
            cpf_alimentador,
            mat_orgao,
            unidade_sei,
            email_institucional,
            email_pessoal,
            cnpj_alimentador,
            nome_empresa,
            num_contrato,
            
            password: passwordHash
        }, select:{
            id_alimentador: true,
            nome_alimentador: true,
            nome_orgao: true,
            cargo: true,
            profissao: true,
            nivel_escolaridade: true,
            sexo: true,
            genero: true,
            mat_orgao: true,
            unidade_sei: true,
            email_institucional: true,
            email_pessoal: true,
            cnpj_alimentador: true,
            nome_empresa: true,
            num_contrato: true,

        }     
    })
return user

}

}
export {CreateUserAlimentadorService}