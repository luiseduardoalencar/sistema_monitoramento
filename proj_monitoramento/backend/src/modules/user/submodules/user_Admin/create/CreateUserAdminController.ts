import {Request, Response} from 'express';
import { CreateUserAdminService } from './CreateUserAdminService';
class CreateUserAdminController{
    async handle(req:Request, res:Response){
        const{ 
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
          
            password} = req.body;


            const createuserservice = new CreateUserAdminService();
            const user =  await createuserservice.execute({
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
            password
            })

            return res.json(user);
}
}
export {CreateUserAdminController}