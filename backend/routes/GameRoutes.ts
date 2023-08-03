import express from "express";
import {
  getGames,
  getGenre,
  getParentPlatform,
} from "../controller/GameController";

const router = express.Router();

router.get("/games", getGames);
router.get("/genres", getGenre);
router.get("/platforms/lists/parents", getParentPlatform);

export default router;
