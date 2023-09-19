import { Request,Response,NextFunction } from "express";
import { verify } from "jsonwebtoken";

interface IPayload{
    sub: string;
    role: string;
}
export function isAuthenticated(req: Request, res: Response, next: NextFunction){

    //receber o token
    const authToken = req.headers.authorization;

    if(!authToken){
        return res.status(401).end();
    }

    const [, token] = authToken.split(" ");

    try{
        //validar se token é valido
        const { sub, role } = verify(token, process.env.JWT_SECRET) as IPayload;

        //recuperar id do token e colocar dentro de uma variavel user_id dentro do request
        req.user_id = sub;
        req.user_role = role;

        return next();
    }catch(err){
        return res.status(401).end();
    }

}

export function isAlimentador(req: Request, res: Response, next: NextFunction) {
    if (req.user_role === "alimentador") {
      return next();
    } else {
      return res.status(403).json({ error: "Acesso não autorizado." });
    }
  }
  
  export function isFiscal(req: Request, res: Response, next: NextFunction) {
    if (req.user_role === "fiscal") {
      return next();
    } else {
      return res.status(403).json({ error: "Acesso não autorizado." });
    }
  }
  
  export function isAdmin(req: Request, res: Response, next: NextFunction) {
    if (req.user_role === "admin") {
      return next();
    } else {
      return res.status(403).json({ error: "Acesso não autorizado." });
    }
  }
