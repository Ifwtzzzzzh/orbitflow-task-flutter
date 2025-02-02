import { Request, Response, Router } from "express";
import { db } from "../db";
import { users } from "../db/schema";
import { eq } from "drizzle-orm";
import bcryptjs from "bcryptjs";

const authRouter = Router();

interface SignUpBody {
  name: string;
  email: string;
  password: string;
}

authRouter.post(
  "/signup",
  async (req: Request<{}, {}, SignUpBody>, res: Response) => {
    try {
      const { name, email, password } = req.body;
      const existingUser = await db
        .select()
        .from(users)
        .where(eq(users.email, email));

      if (existingUser.length) {
        res
          .status(400)
          .json({ msg: "User with the same email already exist!" });
        return;
      }
      const hashedPassword = await bcryptjs.hash(password, 8);
    } catch (e) {
      res.status(500).json({ error: e });
    }
  }
);

authRouter.get("/", (req, res) => {
  res.send("Hey there! from auth");
});

export default authRouter;
