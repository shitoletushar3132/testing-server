import express, { Request, Response } from "express";
import os = require("os");
const app = express();
const port = process.env.PORT || 10000;

// Unique log to identify the container

app.get("/", (req: Request, res: Response) => {
  console.log(`Request handled by: ${os.hostname()}`);
  res.send(`Hello, TypeScript Express! ${os.hostname()}`);
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
