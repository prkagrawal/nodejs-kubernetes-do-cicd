import express, { Express, Request, Response } from "express";

const app: Express = express();

app.use("/", (req: Request, res: Response) => {
    res.send("Api is running...")
});

app.listen(4000, () => {
    console.log("Server is ready at http://localhost:4000");
})