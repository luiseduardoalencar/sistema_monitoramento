import { Request, Response } from "express";
import { UpdateUserFiscalService } from "./UpdateUserFiscalService";

class UpdateUserFiscalController {
  async handle(req: Request, res: Response) {
    const user_id = req.user_id;
    const newData = req.body; 
    
    if (newData.cpf_fiscal || newData.password){
        throw new Error("Essa informação não pode ser alterada");
    }
    const updateUserFiscalService = new UpdateUserFiscalService();

    try {
      const updatedUser = await updateUserFiscalService.execute(user_id, newData);
      return res.json(updatedUser);
    } catch (error) {
      return res.status(400).json({ error: error.message });
    }
  }
}

export { UpdateUserFiscalController };
