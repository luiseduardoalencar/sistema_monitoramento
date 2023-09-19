import { Request, Response } from "express";
import { UpdateUserAdminService } from "./UpdateUserAdminService";

class UpdateUserAdminController {
  async handle(req: Request, res: Response) {
    const user_id = req.user_id;
    const newData = req.body; 
    
    if (newData.cpf_admin || newData.password){
        throw new Error("Essa informação não pode ser alterada");
    }
    const updateUserAdminService = new UpdateUserAdminService();

    try {
      const updatedUser = await updateUserAdminService.execute(user_id, newData);
      return res.json(updatedUser);
    } catch (error) {
      return res.status(400).json({ error: error.message });
    }
  }
}

export { UpdateUserAdminController };
