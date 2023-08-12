import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient({ log: ["query"] });

export const getGames = async (_req: Request, res: Response) => {
  try {
    const response = await prisma.game.findMany();
    //console.log(response.length);

    res.status(200).json(response);
  } catch (error: any) {
    return res
      .status(500)
      .json({ msg: error.message || "Internal server eror" });
  }
};

export const getGenre = async (_req: Request, res: Response) => {
  try {
    const response = await prisma.genre.findMany();
    res.status(200).json(response);
  } catch (error: any) {
    res.status(500).json({ msg: error.message || "cannot get genre" });
  }
};

export const getParentPlatform = async (_req: Request, res: Response) => {
  try {
    const response = await prisma.parentPlatform.findMany();
    res.status(200).json(response);
  } catch (error: any) {
    res.status(500).json({ msg: error.message || "can't get parentplatform" });
  }
};

//export const getGames =
// async function getGame() {
//   const response = await prisma.game.findMany();
//   return response;
// }

// let re
// export const getGames = getGame()
//   .then((reult) => {
//     //return reult;
//     console.log(reult);
//   })
//   .catch((e) => {
//     console.error(e.message);
//   })
//   .finally(async () => {
//     await prisma.$disconnect();
//   });
//console.log(getGames);
