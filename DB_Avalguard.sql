CREATE TABLE "Plante" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "saison" varchar,
  "arrosage" varchar
);

CREATE TABLE "Jardin" (
  "id" integer PRIMARY KEY,
  "user_id" integer
);

CREATE TABLE "Section" (
  "id" integer PRIMARY KEY,
  "plante_id" integer,
  "jardin_id" integer,
  "task_id" integer
);

CREATE TABLE "Task" (
  "id" integer PRIMARY KEY,
  "arrosé" bool,
  "récolté" bool,
  "frequence" date
);

CREATE TABLE "Capteurs" (
  "id" integer PRIMARY KEY,
  "section_id" integer,
  "type_id" integer
);

CREATE TABLE "Type" (
  "id" integer PRIMARY KEY,
  "humidity" integer,
  "temp" integer
);

CREATE TABLE "Historique" (
  "id" integer PRIMARY KEY,
  "task_id" integer,
  "old_task" date
);

CREATE TABLE "User" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "adresse" varchar
);

ALTER TABLE "Jardin" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "Section" ADD FOREIGN KEY ("plante_id") REFERENCES "Plante" ("id");

ALTER TABLE "Section" ADD FOREIGN KEY ("jardin_id") REFERENCES "Jardin" ("id");

ALTER TABLE "Section" ADD FOREIGN KEY ("task_id") REFERENCES "Task" ("id");

ALTER TABLE "Capteurs" ADD FOREIGN KEY ("section_id") REFERENCES "Section" ("id");

ALTER TABLE "Capteurs" ADD FOREIGN KEY ("type_id") REFERENCES "Type" ("id");

ALTER TABLE "Historique" ADD FOREIGN KEY ("task_id") REFERENCES "Task" ("id");
