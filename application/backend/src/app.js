// app.js mein
import express from "express";
import cors from "cors";

const app = express();

// CORS configuration
const corsOptions = {
  origin: [
    'http://task.supdeity.com',
    'http://api.task.supdeity.com'
  ],
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true
};

app.use(cors(corsOptions));
app.use(express.json());

app.get("/api/health", (req, res) => {
  res.status(200).json({
    status: "ok",
    message: "Server is healthy",
    timestamp: new Date().toISOString(),
  });
});

app.use("/api/tasks", taskRoutes);

export default app;