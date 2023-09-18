import {Request, Response} from 'express';
import { CreateUserFiscalService } from './CreateUserFiscalService';
class CreateUserFiscalController{
    async handle(req:Request, res:Response){
        const{ 
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
            password} = req.body;


            const createuserservice = new CreateUserFiscalService();
            const user =  await createuserservice.execute({
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
            password
            })

            return res.json(user);
}
}
export {CreateUserFiscalController}