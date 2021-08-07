const express = require('express');
import { Response, Request} from "express";
const app = express();

app.get('/', (_: Request, res: Response) => {
  res.send('hello world')
})

const PORT = 4000;

app.listen(4000, () => {
  console.log(`server listens on ${PORT}`);
})
