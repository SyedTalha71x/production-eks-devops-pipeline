import { Router } from "express";
import Task from "../models/task.model.js";

const router = Router();

/**
 * GET all tasks
 */
router.get("/", async (req, res) => {
  const tasks = await Task.find().sort({ createdAt: -1 });
  res.json(tasks);
});

/**
 * CREATE task
 */
router.post("/", async (req, res) => {
  const task = await Task.create({ title: req.body.title });
  res.status(201).json(task);
});

/**
 * UPDATE task
 */
router.patch("/:id", async (req, res) => {
  const task = await Task.findByIdAndUpdate(
    req.params.id,
    req.body,
    { new: true }
  );
  res.json(task);
});

/**
 * DELETE task
 */
router.delete("/:id", async (req, res) => {
  await Task.findByIdAndDelete(req.params.id);
  res.json({ message: "Task deleted" });
});

export default router;
