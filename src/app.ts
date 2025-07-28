import express from 'express';
import path from 'path';

const app = express();
const port = 8000;

// Serve static files from "public" directory
app.use(express.static(path.join(__dirname, '../public')));

app.listen(port, () => {
  console.log(`Static site running at http://localhost:${port}`);
});
