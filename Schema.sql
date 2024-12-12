CREATE TABLE "Plante" (
  "id" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Jardin" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "name" varchar,
  "climat_id" integer
);

CREATE TABLE "Section" (
  "id" integer PRIMARY KEY,
  "plante_id" integer,
  "jardin_id" integer,
  "position_x" integer,
  "position_y" integer
);

CREATE TABLE "Entretien" (
  "id" integer PRIMARY KEY,
  "plante_id" integer,
  "description" varchar,
  "type_entretien_id" integer,
  "frequence" date
);

CREATE TABLE "Capteurs" (
  "id" integer PRIMARY KEY,
  "section_id" integer,
  "type_id" integer,
  "name" varchar
);

CREATE TABLE "Type" (
  "id" integer PRIMARY KEY,
  "humidity" integer,
  "temp" integer
);

CREATE TABLE "Historique" (
  "id" integer PRIMARY KEY,
  "task_id" integer,
  "date" datetime,
  "section_id" integer
);

CREATE TABLE "User" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "adresse_mail" varchar,
  "mot_de_passe" varchar
);

CREATE TABLE "Climat" (
  "id" integer PRIMARY KEY,
  "climat" varchar
);

CREATE TABLE "Entretien_Type" (
  "id" integer PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "Jardin" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "Jardin" ADD FOREIGN KEY ("climat_id") REFERENCES "Climat" ("id");

ALTER TABLE "Section" ADD FOREIGN KEY ("plante_id") REFERENCES "Plante" ("id");

ALTER TABLE "Section" ADD FOREIGN KEY ("jardin_id") REFERENCES "Jardin" ("id");

ALTER TABLE "Entretien" ADD FOREIGN KEY ("plante_id") REFERENCES "Plante" ("id");

ALTER TABLE "Entretien" ADD FOREIGN KEY ("type_entretien_id") REFERENCES "Entretien_Type" ("id");

ALTER TABLE "Capteurs" ADD FOREIGN KEY ("section_id") REFERENCES "Section" ("id");

ALTER TABLE "Capteurs" ADD FOREIGN KEY ("type_id") REFERENCES "Type" ("id");

ALTER TABLE "Historique" ADD FOREIGN KEY ("task_id") REFERENCES "Entretien" ("id");

ALTER TABLE "Historique" ADD FOREIGN KEY ("section_id") REFERENCES "Section" ("id");
