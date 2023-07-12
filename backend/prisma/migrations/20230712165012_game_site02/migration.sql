-- AlterTable
CREATE SEQUENCE shortscreenshot_id_seq;
ALTER TABLE "ShortScreenshot" ALTER COLUMN "id" SET DEFAULT nextval('shortscreenshot_id_seq');
ALTER SEQUENCE shortscreenshot_id_seq OWNED BY "ShortScreenshot"."id";
