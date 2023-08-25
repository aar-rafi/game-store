import { PrismaClient } from "@prisma/client";
import data from "../games3.json";

const prisma = new PrismaClient();

async function seed() {
  try {
    // Seed the Game model
    for (const gameData of data) {
      await prisma.game.create({
        data: {
          id: gameData.id,
          slug: gameData.slug,
          name: gameData.name,
          released: gameData.released,
          tba: gameData.tba,
          background_image: gameData.background_image,
          rating: gameData.rating,
          rating_top: gameData.rating_top,
          ratings_count: gameData.ratings_count,
          added_count: gameData.added,
          metacritic: gameData.metacritic,
          playtime: gameData.playtime,
          suggestions_count: gameData.suggestions_count,
          updated: gameData.updated,
          reviews_count: gameData.reviews_count,
          clips: gameData.clip ? gameData.clip : "",
          esrb_rating: {
            connectOrCreate: {
              where: { id: gameData.esrb_rating.id },
              create: {
                ...gameData.esrb_rating,
              },
            },
          },
          added_by_status: gameData.added_by_status
            ? {
                create: {
                  ...gameData.added_by_status,
                },
              }
            : {},
        },
      });

      // Seed the ratings
      for (const ratingData of gameData.ratings) {
        await prisma.ratingLevel.upsert({
          where: {
            id: ratingData.id,
          },
          update: {
            game_rating: {
              create: {
                gameId: gameData.id,
                count: ratingData.count,
                percent: ratingData.percent,
              },
            },
          },
          create: {
            id: ratingData.id,
            title: ratingData.title,
            game_rating: {
              create: {
                gameId: gameData.id,
                count: ratingData.count,
                percent: ratingData.percent,
              },
            },
          },
        });
      }

      // Seed the platforms
      for (const platformData of gameData.platforms) {
        await prisma.platform.upsert({
          where: {
            id: platformData.platform.id,
          },
          update: {
            games: {
              create: {
                gameId: gameData.id,
                recommended_requirements: JSON.stringify(
                  platformData.requirements_ru?.recommended
                ),
                minimum_requirements: platformData.requirements_en?.minimum,
              },
            },
          },
          create: {
            id: platformData.platform.id,
            name: platformData.platform.name,
            slug: platformData.platform.slug,
            image: platformData.platform.image,
            year_end: platformData.platform.year_end,
            year_start: platformData.platform.year_start,
            games_count: platformData.platform.games_count,
            image_background: platformData.platform.image_background,

            games: {
              create: {
                gameId: gameData.id,
                recommended_requirements: JSON.stringify(
                  platformData.requirements_ru?.recommended
                ),
                minimum_requirements: platformData.requirements_en?.minimum,
              },
            },
          },
        });
      }

      // Seed the parent_platforms
      for (const parentPlatformData of gameData.parent_platforms) {
        await prisma.parentPlatform.upsert({
          where: {
            id: parentPlatformData.platform.id,
          },
          update: {
            games: {
              connect: {
                id: gameData.id,
              },
            },
          },
          create: {
            id: parentPlatformData.platform.id,
            name: parentPlatformData.platform.name,
            slug: parentPlatformData.platform.slug,
            games: {
              connect: {
                id: gameData.id,
              },
            },
          },
        });
      }

      // Seed the genres
      for (const genreData of gameData.genres) {
        await prisma.genre.upsert({
          where: {
            id: genreData.id,
          },
          update: {
            games: {
              connect: {
                id: gameData.id,
              },
            },
          },
          create: {
            id: genreData.id,
            name: genreData.name,
            slug: genreData.slug,
            games_count: genreData.games_count,
            image_background: genreData.image_background,
            games: {
              connect: {
                id: gameData.id,
              },
            },
          },
        });
      }

      // Seed the stores
      for (const storeData of gameData.stores) {
        await prisma.store.upsert({
          where: {
            id: storeData.id,
          },
          update: {
            game: {
              connect: {
                id: gameData.id,
              },
            },
          },
          create: {
            id: storeData.id,
            name: storeData.name,
            slug: storeData.slug,
            domain: storeData.domain,
            games_count: storeData.games_count,
            image_background: storeData.image_background,
            game: {
              connect: {
                id: gameData.id,
              },
            },
          },
        });
      }

      // Seed the tags
      for (const tagData of gameData.tags) {
        await prisma.tag.upsert({
          where: {
            id: tagData.id,
          },
          update: {
            games: {
              connect: {
                id: gameData.id,
              },
            },
          },
          create: {
            id: tagData.id,
            name: tagData.name,
            slug: tagData.slug,
            language: tagData.language,
            games_count: tagData.games_count,
            image_background: tagData.image_background,
            games: {
              connect: {
                id: gameData.id,
              },
            },
          },
        });
      }

      // Seed the short_screenshots
      for (const screenshotData of gameData.short_screenshots) {
        await prisma.shortScreenshot.create({
          data: {
            id: screenshotData.id,
            image: screenshotData.image,
            gameId: gameData.id,
          },
        });
      }
    }

    console.log("Data seeding completed.");
  } catch (error) {
    console.error("Error seeding data:", error);
  } finally {
    await prisma.$disconnect();
  }
}

seed();
