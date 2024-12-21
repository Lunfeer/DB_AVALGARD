--Listes de quelques queries--
--Nombres de plantes dans un jardin--
SELECT j.nom,count(s.id) AS "Nombre de plante"
FROM section AS s
JOIN jardin AS j
ON s.jardin_id = j.id
GROUP BY j.nom


--Liste des capteurs d'un jardin--
SELECT c.nom
FROM capteurs c
JOIN section s
ON c.section_id = s.id
JOIN jardin j
ON s.jardin_id = j.id
WHERE j.id = 1;


--Liste des entretiens effectués pour un jardin spécifique--
SELECT et.nom "Nom de l'entretien", 
    DATE(h.date) "Date de l'entretien"
FROM historique AS h
JOIN entretien AS t
ON h.entretien_id = t.id
JOIN entretien_type AS et
ON t.type_entretien_id = et.id
JOIN section AS s
ON h.section_id=s.id
JOIN jardin AS j
ON s.jardin_id=j.id
WHERE j.id = 1

--Position de la section et le nom de jardin où la section est--
SELECT '(' || s.position_x || ',' || s.position_y || ')' "Position de la section", j.nom
FROM section s
JOIN jardin j
ON s.jardin_id = j.id
GROUP BY s.position_x, s.position_y;

--Liste des entretiens effectués pour une plante d'un jardin spécifique (pour une section spécifique)
SELECT 
    p.nom AS nom_plante, 
    et.nom AS type_entretien, 
    h.date AS date_entretien,
    j.nom AS nom_jardin
FROM Historique h
JOIN Entretien e ON h.entretien_id = e.id
JOIN Plante p ON e.plante_id = p.id
JOIN Entretien_Type et ON e.type_entretien_id = et.id
JOIN Section s ON h.section_id = s.id
JOIN Jardin j ON s.jardin_id = j.id
WHERE s.id = 1
ORDER BY h.date DESC;

--Liste des entretiens à faire dans un jardin (avec le retard indiqué)
SELECT 
    p.nom AS nom_plante,
    et.nom AS type_entretien,
    MAX(h.date) AS derniere_date,
    MAX(h.date) + e.frequence AS date_limite,
    EXTRACT(DAY FROM (CURRENT_TIMESTAMP - (MAX(h.date) + e.frequence))) AS jours_de_retard
FROM Entretien e
JOIN Plante p ON e.plante_id = p.id
JOIN Entretien_Type et ON e.type_entretien_id = et.id
JOIN Section s ON p.id = s.plante_id
JOIN Jardin j ON s.jardin_id = j.id
JOIN Historique h ON e.id = h.entretien_id AND h.section_id = s.id
WHERE j.id = 1
GROUP BY 
    p.nom, 
    et.nom, 
    e.frequence
HAVING 
    EXTRACT(DAY FROM (CURRENT_TIMESTAMP - (MAX(h.date) + e.frequence))) > 0
ORDER BY jours_de_retard DESC;

--Liste des futurs entretiens à réaliser dans un jardin
SELECT 
    p.nom AS nom_plante,
    et.nom AS type_entretien,
    MAX(h.date) AS derniere_date,
    MAX(h.date) + e.frequence AS prochaine_date,
    EXTRACT(DAY FROM (MAX(h.date) + e.frequence - CURRENT_TIMESTAMP)) AS jours_restants
FROM Entretien e
JOIN Plante p ON e.plante_id = p.id
JOIN Entretien_Type et ON e.type_entretien_id = et.id
JOIN Section s ON p.id = s.plante_id
JOIN Jardin j ON s.jardin_id = j.id
JOIN Historique h ON e.id = h.entretien_id AND h.section_id = s.id
WHERE j.id = 1
GROUP BY 
    p.nom, 
    et.nom, 
    e.frequence
HAVING 
    EXTRACT(DAY FROM (MAX(h.date) + e.frequence - CURRENT_TIMESTAMP)) > 0
ORDER BY prochaine_date;