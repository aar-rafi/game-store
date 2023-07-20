import express from "express";
import { getGames, getGenre } from "../controller/GameController";

const router = express.Router();

router.get("/games", getGames);
router.get("/genres", getGenre);

export default router;
