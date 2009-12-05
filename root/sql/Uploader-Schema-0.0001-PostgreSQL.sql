-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Sat Dec  5 21:34:48 2009
-- 
--
-- Table: role
--
DROP TABLE "role" CASCADE;
CREATE TABLE "role" (
  "id" integer NOT NULL,
  "role" text,
  PRIMARY KEY ("id")
);

--
-- Table: user
--
DROP TABLE "user" CASCADE;
CREATE TABLE "user" (
  "id" serial NOT NULL,
  "username" text NOT NULL,
  "password" text NOT NULL,
  "email_address" text NOT NULL,
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "active" integer NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Table: user_role
--
DROP TABLE "user_role" CASCADE;
CREATE TABLE "user_role" (
  "user_id" integer NOT NULL,
  "role_id" integer NOT NULL,
  PRIMARY KEY ("user_id", "role_id")
);
CREATE INDEX "user_role_idx_role_id" on "user_role" ("role_id");
CREATE INDEX "user_role_idx_user_id" on "user_role" ("user_id");

--
-- Foreign Key Definitions
--

ALTER TABLE "user_role" ADD FOREIGN KEY ("role_id")
  REFERENCES "role" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

ALTER TABLE "user_role" ADD FOREIGN KEY ("user_id")
  REFERENCES "user" ("id") DEFERRABLE;

