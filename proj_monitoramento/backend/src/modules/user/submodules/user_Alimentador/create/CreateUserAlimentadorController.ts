import {Request, Response} from 'express';
import { CreateUserAlimentadorService } from './CreateUserAlimentadorService';
class CreateUserAlimentadorController{
    async handle(req:Request, res:Response){
        const{ 
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
            password} = req.body;


            const createuserservice = new CreateUserAlimentadorService();
            const user =  await createuserservice.execute({
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
            password
            })

            return res.json(user);
}
}
export {CreateUserAlimentadorController}