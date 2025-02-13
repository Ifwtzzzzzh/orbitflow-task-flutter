import { Router } from "express";
import { auth, AuthRequest } from "../middleware/auth";
import { error } from "console";
import { NewTask, tasks } from "../db/schema";
import { db } from "../db";
import { eq } from "drizzle-orm";

const taskRouter = Router();

taskRouter.post("/", auth, async (req: AuthRequest, res) => {
  try {
    req.body = { ...req.body, uid: req.user };
    const newTask: NewTask = req.body;
    const [task] = await db.insert(tasks).values(newTask).returning();
    res.status(201).json(task);
  } catch (e) {
    res.status(500).json({ error: e });
  }
});

taskRouter.get("/", auth, async (req: AuthRequest, res) => {
  try {
    const allTasks = await db
      .select()
      .from(tasks)
      .where(eq(tasks.uid, req.user!));
    res.status(201).json(allTasks);
  } catch (e) {
    res.status(500).json({ error: e });
  }
});

export default taskRouter;
