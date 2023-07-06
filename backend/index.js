"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = __importDefault(require("dotenv"));
//import ProductRoute from './routes/ProductRoute.js'
dotenv_1.default.config();
const app = (0, express_1.default)();
const port = process.env.APP_PORT || 5000;
app.use((0, cors_1.default)());
app.use(express_1.default.json());
app.get("/", (req, res) => {
    res.send("Hello World!");
});
//app.use(ProductRoute)
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
exports.default = app;
