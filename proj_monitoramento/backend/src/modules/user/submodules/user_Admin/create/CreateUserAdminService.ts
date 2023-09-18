import { ICreateUserAdminDTO } from "../../../Interfaces/ICreateUserAdminDTO";
import prismaClient from "../../../../../prisma";
import { hash } from "bcryptjs";

class CreateUserAdminService{
async execute({nome_admin,nome_orgao,cargo,profissao,nivel_escolaridade, sexo,genero,cpf_admin,mat_orgao,unidade_sei,email_institucional,email_pessoal,nome_empresa,num_contrato,password}:ICreateUserAdminDTO){

    if(!cpf_admin){
        throw new Error("CPF incorreto");
    }

    const userAlreadyExists = await prismaClient.user_admin.findFirst({
        where:{
            cpf_admin: cpf_admin
        }
    })
    if(userAlreadyExists){
        throw new Error("User already exists");
    }

    const passwordHash = await hash(password, 8);

    const user = await prismaClient.user_admin.create({
        data:{
            nome_admin,
            nome_orgao,
            cargo,
            profissao,
            nivel_escolaridade, 
            sexo,
            genero,
            cpf_admin,
            mat_orgao,
            unidade_sei,
            email_institucional,
            email_pessoal,
            nome_empresa,
            num_contrato,
            password: passwordHash
        }, select:{
            id_admin: true,
            nome_admin: true,
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
            nome_empresa: true,
            num_contrato: true,

        }     
    })
return user

}

}
export {CreateUserAdminService}