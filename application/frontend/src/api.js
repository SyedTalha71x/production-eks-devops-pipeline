const API_URL = process.env.REACT_APP_API_URL;


// /
export const getTasks = async () => {
  const res = await fetch(`${API_URL}/api/tasks`);
  return res.json();
};

export const createTask = async (title) => {
  const res = await fetch(`${API_URL}/api/tasks`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ title })
  });
  return res.json();
};

export const updateTask = async (id, data) => {
  await fetch(`${API_URL}/api/tasks/${id}`, {
    method: "PATCH",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data)
  });
};

export const deleteTask = async (id) => {
  await fetch(`${API_URL}/api/tasks/${id}`, {
    method: "DELETE"
  });
};
