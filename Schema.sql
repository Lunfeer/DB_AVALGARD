CREATE TABLE Plante (
  id integer PRIMARY KEY,
  nom varchar(50) not null
);

CREATE TABLE Jardin (
  id integer PRIMARY KEY,
  utilisateur_id integer not null,
  nom varchar(255) not null,
  climat_id integer
);

CREATE TABLE Section (
  id integer PRIMARY KEY,
  plante_id integer not null,
  jardin_id integer not null,
  position_x integer not null,
  position_y integer not null
);

CREATE TABLE Entretien (
  id integer PRIMARY KEY,
  plante_id integer not null,
  type_entretien_id integer not null,
  frequence interval not null
);

CREATE TABLE Capteurs (
  id integer PRIMARY KEY,
  section_id integer not null,
  capteur_type_id integer  not null,
  nom varchar(50) not null
);

CREATE TABLE Capteur_Type (
  id integer PRIMARY KEY,
  nom varchar(20) not null unique
);

CREATE TABLE Historique (
  id integer PRIMARY KEY,
  entretien_id integer not null,
  date timestamp(3) not null,
  section_id integer not null
);

CREATE TABLE Utilisateur (
  id integer PRIMARY KEY,
  nom varchar(50) unique not null,
  adresse_mail varchar(255) unique not null,
  mot_de_passe_coupe varchar(255) not null
);

CREATE TABLE Climat (
  id integer PRIMARY KEY,
  climat varchar(20) unique not null
);

CREATE TABLE Entretien_Type (
  id integer PRIMARY KEY,
  nom varchar(20) unique not null,
  description varchar
);

ALTER TABLE Jardin ADD FOREIGN KEY (utilisateur_id) REFERENCES Utilisateur (id) ON DELETE CASCADE;

ALTER TABLE Jardin ADD FOREIGN KEY (climat_id) REFERENCES Climat (id);

ALTER TABLE Section ADD FOREIGN KEY (plante_id) REFERENCES Plante (id) ON DELETE CASCADE;

ALTER TABLE Section ADD FOREIGN KEY (jardin_id) REFERENCES Jardin (id) ON DELETE CASCADE;

ALTER TABLE Entretien ADD FOREIGN KEY (plante_id) REFERENCES Plante (id) ON DELETE CASCADE;

ALTER TABLE Entretien ADD FOREIGN KEY (type_entretien_id) REFERENCES Entretien_Type (id) ON DELETE CASCADE;

ALTER TABLE Capteurs ADD FOREIGN KEY (section_id) REFERENCES Section (id) ON DELETE CASCADE;

ALTER TABLE Capteurs ADD FOREIGN KEY (capteur_type_id) REFERENCES Capteur_Type (id) ON DELETE CASCADE;

ALTER TABLE Historique ADD FOREIGN KEY (entretien_id) REFERENCES Entretien (id) ON DELETE CASCADE;

ALTER TABLE Historique ADD FOREIGN KEY (section_id) REFERENCES Section (id) ON DELETE CASCADE;


CREATE INDEX idx_section_plante ON Section(plante_id);
CREATE INDEX idx_section_jardin ON Section(jardin_id);

CREATE INDEX idx_jardin_utilisateur ON Jardin(utilisateur_id);

CREATE INDEX idx_entretien_plante ON Entretien(plante_id);
CREATE INDEX idx_entretien_type ON Entretien(type_entretien_id);

CREATE INDEX idx_historique_entretien ON Historique(entretien_id);
CREATE INDEX idx_historique_section ON Historique(section_id);
CREATE INDEX idx_historique_date ON Historique(date);

CREATE INDEX idx_capteurs_section ON Capteurs(section_id);
