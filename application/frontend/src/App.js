import { useEffect, useState } from "react";
import {
  getTasks,
  createTask,
  updateTask,
  deleteTask
} from "./api";

function App() {
  const [tasks, setTasks] = useState([]);
  const [title, setTitle] = useState("");

  const loadTasks = async () => {
    const data = await getTasks();
    setTasks(data);
  };

  useEffect(() => {
    loadTasks();
  }, []);

  const handleAdd = async () => {
    if (!title.trim()) return;
    await createTask(title);
    setTitle("");
    loadTasks();
  };

  return (
    <div style={{ padding: 40 }}>
      <h1>MERN Task Manager</h1>

      <input
        value={title}
        placeholder="Enter task"
        onChange={(e) => setTitle(e.target.value)}
      />
      <button onClick={handleAdd}>Add Task</button>

      <ul>
        {tasks.map((task) => (
          <li key={task._id}>
            <span
              onClick={() =>
                updateTask(task._id, {
                  completed: !task.completed
                }).then(loadTasks)
              }
              style={{
                cursor: "pointer",
                textDecoration: task.completed
                  ? "line-through"
                  : "none"
              }}
            >
              {task.title}
            </span>

            <button
              onClick={() =>
                deleteTask(task._id).then(loadTasks)
              }
            >
              ❌
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
