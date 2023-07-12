-- CreateTable
CREATE TABLE "Game" (
    "id" INTEGER NOT NULL,
    "slug" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "released" TEXT NOT NULL,
    "tba" BOOLEAN NOT NULL,
    "background_image" TEXT NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "rating_top" DOUBLE PRECISION NOT NULL,
    "ratings_count" INTEGER NOT NULL,
    "reviews_text_count" INTEGER NOT NULL,
    "added" INTEGER NOT NULL,
    "metacritic" INTEGER NOT NULL,
    "playtime" INTEGER NOT NULL,
    "suggestions_count" INTEGER NOT NULL,
    "updated" TEXT NOT NULL,
    "user_game" TEXT,
    "reviews_count" INTEGER NOT NULL,
    "saturated_color" TEXT NOT NULL,
    "dominant_color" TEXT NOT NULL,
    "clip" TEXT NOT NULL,

    CONSTRAINT "Game_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rating" (
    "id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "count" INTEGER NOT NULL,
    "percent" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Rating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AddedByStatus" (
    "id" SERIAL NOT NULL,
    "yet" INTEGER NOT NULL,
    "owned" INTEGER NOT NULL,
    "beaten" INTEGER NOT NULL,
    "toplay" INTEGER NOT NULL,
    "dropped" INTEGER NOT NULL,
    "playing" INTEGER NOT NULL,
    "gameId" INTEGER NOT NULL,

    CONSTRAINT "AddedByStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlatformOnGames" (
    "minimum_requirements" TEXT,
    "recommended_requirements" TEXT,
    "gameId" INTEGER NOT NULL,
    "platformId" INTEGER NOT NULL,

    CONSTRAINT "PlatformOnGames_pkey" PRIMARY KEY ("gameId","platformId")
);

-- CreateTable
CREATE TABLE "Platform" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "image" TEXT,
    "year_end" INTEGER,
    "year_start" INTEGER,
    "games_count" INTEGER NOT NULL,
    "image_background" TEXT NOT NULL,

    CONSTRAINT "Platform_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ParentPlatform" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,

    CONSTRAINT "ParentPlatform_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Genre" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "games_count" INTEGER NOT NULL,
    "image_background" TEXT NOT NULL,

    CONSTRAINT "Genre_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Store" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "domain" TEXT NOT NULL,
    "games_count" INTEGER NOT NULL,
    "image_background" TEXT NOT NULL,

    CONSTRAINT "Store_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tag" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "language" TEXT NOT NULL,
    "games_count" INTEGER NOT NULL,
    "image_background" TEXT NOT NULL,

    CONSTRAINT "Tag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EsrbRating" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,

    CONSTRAINT "EsrbRating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShortScreenshot" (
    "id" INTEGER NOT NULL,
    "image" TEXT NOT NULL,
    "gameId" INTEGER NOT NULL,

    CONSTRAINT "ShortScreenshot_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_GameToParentPlatform" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GameToGenre" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GameToStore" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GameToTag" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GameToRating" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EsrbRatingToGame" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Game_slug_name_key" ON "Game"("slug", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Rating_title_key" ON "Rating"("title");

-- CreateIndex
CREATE UNIQUE INDEX "AddedByStatus_gameId_key" ON "AddedByStatus"("gameId");

-- CreateIndex
CREATE UNIQUE INDEX "Platform_slug_key" ON "Platform"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "ParentPlatform_slug_key" ON "ParentPlatform"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Genre_slug_key" ON "Genre"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Store_slug_key" ON "Store"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_slug_key" ON "Tag"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "EsrbRating_slug_key" ON "EsrbRating"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "ShortScreenshot_image_key" ON "ShortScreenshot"("image");

-- CreateIndex
CREATE UNIQUE INDEX "_GameToParentPlatform_AB_unique" ON "_GameToParentPlatform"("A", "B");

-- CreateIndex
CREATE INDEX "_GameToParentPlatform_B_index" ON "_GameToParentPlatform"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GameToGenre_AB_unique" ON "_GameToGenre"("A", "B");

-- CreateIndex
CREATE INDEX "_GameToGenre_B_index" ON "_GameToGenre"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GameToStore_AB_unique" ON "_GameToStore"("A", "B");

-- CreateIndex
CREATE INDEX "_GameToStore_B_index" ON "_GameToStore"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GameToTag_AB_unique" ON "_GameToTag"("A", "B");

-- CreateIndex
CREATE INDEX "_GameToTag_B_index" ON "_GameToTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GameToRating_AB_unique" ON "_GameToRating"("A", "B");

-- CreateIndex
CREATE INDEX "_GameToRating_B_index" ON "_GameToRating"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EsrbRatingToGame_AB_unique" ON "_EsrbRatingToGame"("A", "B");

-- CreateIndex
CREATE INDEX "_EsrbRatingToGame_B_index" ON "_EsrbRatingToGame"("B");

-- AddForeignKey
ALTER TABLE "AddedByStatus" ADD CONSTRAINT "AddedByStatus_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlatformOnGames" ADD CONSTRAINT "PlatformOnGames_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlatformOnGames" ADD CONSTRAINT "PlatformOnGames_platformId_fkey" FOREIGN KEY ("platformId") REFERENCES "Platform"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShortScreenshot" ADD CONSTRAINT "ShortScreenshot_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToParentPlatform" ADD CONSTRAINT "_GameToParentPlatform_A_fkey" FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToParentPlatform" ADD CONSTRAINT "_GameToParentPlatform_B_fkey" FOREIGN KEY ("B") REFERENCES "ParentPlatform"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGenre" ADD CONSTRAINT "_GameToGenre_A_fkey" FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGenre" ADD CONSTRAINT "_GameToGenre_B_fkey" FOREIGN KEY ("B") REFERENCES "Genre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToStore" ADD CONSTRAINT "_GameToStore_A_fkey" FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToStore" ADD CONSTRAINT "_GameToStore_B_fkey" FOREIGN KEY ("B") REFERENCES "Store"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToTag" ADD CONSTRAINT "_GameToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToTag" ADD CONSTRAINT "_GameToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToRating" ADD CONSTRAINT "_GameToRating_A_fkey" FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToRating" ADD CONSTRAINT "_GameToRating_B_fkey" FOREIGN KEY ("B") REFERENCES "Rating"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EsrbRatingToGame" ADD CONSTRAINT "_EsrbRatingToGame_A_fkey" FOREIGN KEY ("A") REFERENCES "EsrbRating"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EsrbRatingToGame" ADD CONSTRAINT "_EsrbRatingToGame_B_fkey" FOREIGN KEY ("B") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;
