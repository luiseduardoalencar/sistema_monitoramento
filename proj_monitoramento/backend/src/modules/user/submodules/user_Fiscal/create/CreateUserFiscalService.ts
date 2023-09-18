import { ICreateUserFiscalDTO } from "../../../Interfaces/ICreateUserFiscalDTO";
import  prismaClient  from "../../../../../prisma";
import { hash } from "bcryptjs";
class CreateUserFiscalService{
async execute({nome_fiscal,nome_orgao,cargo,profissao,nivel_escolaridade, sexo,genero,cpf_fiscal,mat_orgao,unidade_sei,email_institucional,email_pessoal,cnpj_fiscal,nome_empresa,num_contrato,password}:ICreateUserFiscalDTO){

    if(!cpf_fiscal){
        throw new Error("CPF incorreto");
    }

    const userAlreadyExists = await prismaClient.user_fiscal.findFirst({
        where:{
            cpf_fiscal: cpf_fiscal
        }
    })
    if(userAlreadyExists){
        throw new Error("User already exists");
    }

    const passwordHash = await hash(password, 8);

    const user = await prismaClient.user_fiscal.create({
        data:{
            nome_fiscal,
            nome_orgao,
            cargo,
            profissao,
            nivel_escolaridade, 
            sexo,
            genero,
            cpf_fiscal,
            mat_orgao,
            unidade_sei,
            email_institucional,
            email_pessoal,
            cnpj_fiscal,
            nome_empresa,
            num_contrato,
            password: passwordHash
        }, select:{
            id_fiscal: true,
            nome_fiscal: true,
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
            cnpj_fiscal: true,
            nome_empresa: true,
            num_contrato: true,

        }     
    })
return user

}

}
export {CreateUserFiscalService}