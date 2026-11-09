import "./plugins/env";
import createApi from "./createApi";

const app = createApi();

const port = Number(process.env.PORT) || 5000;

app.listen(port, () => {
  console.log(`Server is on ${port}`);
});
