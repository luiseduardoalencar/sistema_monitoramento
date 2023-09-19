import { Request, Response } from "express";
import { UpdateUserAlimentadorService } from "./UpdateUserAlimentadorService";

class UpdateUserAlimentadorController {
  async handle(req: Request, res: Response) {
    const user_id = req.user_id;
    const newData = req.body; 
    
    if (newData.cpf_alimentador || newData.password){
        throw new Error("Essa informação não pode ser alterada");
    }
    const updateUserAlimentadorService = new UpdateUserAlimentadorService();

    try {
      const updatedUser = await updateUserAlimentadorService.execute(user_id, newData);
      return res.json(updatedUser);
    } catch (error) {
      return res.status(400).json({ error: error.message });
    }
  }
}

export { UpdateUserAlimentadorController };
