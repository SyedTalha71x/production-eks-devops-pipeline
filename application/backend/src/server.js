import dotenv from "dotenv";
import app from "./app.js";
import connectDB from "./config/db.js";

dotenv.config();
connectDB();

const PORT = process.env.PORT || 5008;

app.listen(PORT, () => {
  console.log(`Backend running on port ${PORT}`);
});
