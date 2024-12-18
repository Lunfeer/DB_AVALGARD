INSERT INTO Plante (id, nom) VALUES
(1, 'Tomate'),
(2, 'Carotte'),
(3, 'Basilic'),
(4, 'Laitue'),
(5, 'Piment');
INSERT INTO Utilisateur (id, nom, adresse_mail, mot_de_passe_coupe) VALUES
(1, 'Alice Dupont', 'alice.dupont@email.com', '$2y$10$Bgn.GZQUxYPDAzjeqrPBxO7CmvRa/biep87c3q9x/tEEx15i68dlC'),
(2, 'Bob Martin', 'bob.martin@email.com', '$2y$10$DlnFeNZqJgKpqeS8xg/83etJhrRqnhE6xxzkXpjUuununI.aaGGZm');
INSERT INTO Climat (id, climat) VALUES
(1, 'Tempéré'),
(2, 'Tropical'),
(3, 'Aride');
INSERT INTO Jardin (id, utilisateur_id, nom, climat_id) VALUES
(1, 1, 'Jardin Alice', 1),
(2, 2, 'Jardin Bob', 2);
INSERT INTO Entretien_Type (id, nom, description) VALUES
(1, 'Arrosage', 'Arrosage régulier de la plante'),
(2, 'Taillage', 'Tailler les feuilles ou les tiges'),
(3, 'Fertilisation', 'Appliquer un fertilisant pour la croissance');
INSERT INTO Entretien (id, plante_id, type_entretien_id, frequence) VALUES
(1, 1, 1, '00:10:00'),
(2, 2, 2, '00:15:00'),
(3, 3, 3, '00:20:00'),
(4, 4, 1, '00:30:00'),
(5, 5, 2, '00:25:00');
INSERT INTO Capteur_Type (id, nom) VALUES
(1, 'Température'),
(2, 'Humidité'),
(3, 'Luminosité');
INSERT INTO Section (id, plante_id, jardin_id, position_x, position_y) VALUES
(1, 1, 1, 1, 1),
(2, 2, 1, 2, 1),
(3, 3, 2, 1, 2),
(4, 4, 2, 2, 2),
(5, 5, 1, 1, 2);
INSERT INTO Capteurs (id, section_id, capteur_type_id, nom) VALUES
(1, 1, 1, 'Capteur température 1'),
(2, 2, 2, 'Capteur humidité 1'),
(3, 3, 3, 'Capteur luminosité 1'),
(4, 4, 1, 'Capteur température 2'),
(5, 5, 2, 'Capteur humidité 2');
INSERT INTO Historique (id, entretien_id, date, section_id) VALUES
(1, 1, '2024-12-15 08:00:00', 1),
(2, 2, '2024-12-16 09:00:00', 2),
(3, 3, '2024-12-17 10:00:00', 3),
(4, 4, '2024-12-18 11:00:00', 4),
(5, 5, '2024-12-19 12:00:00', 5);
