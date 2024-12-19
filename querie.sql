--Listes de quelques queries--
--Fiche informative sur une des plantes d'un des utilisteurs--
select p.nom "Nom de la plante", 
    et.nom "Nom de l'entretien", 
    et.description "Description de l'entretien"
from entretien e
join entretien_type et
on e.type_entretien_id = et.id
join plante p
on e.plante_id = p.id
join section s
on p.id = s.plante_id
join jardin j
on s.jardin_id = j.id
join utilisateur u
on j.utilisateur_id = u.id
where u.id = 1;

--Nombres de plantes dans un jardin--
select count(p.id) as "Nombre de plante"
from plante p
join section s
on p.id = s.plante_id
join jardin j
on s.jardin_id = j.id
where j.id = 1;

--Liste des capteurs d'un jardin--
select c.nom
from capteurs c
join section s
on c.section_id = s.id
join jardin j
on s.jardin_id = j.id
where j.id = 1;

--Liste des entretien à venir dans un jardin--
select p.nom "Nom de la plante", 
    et.nom "Prochain entretien prévu", 
    concat( extract(day from age(h.date + t.frequence, now())), ' jours') "Dans: "
from entretien t
join entretien_type et
on t.type_entretien_id = et.id
join plante p
on t.plante_id=p.id
join section s
on p.id = s.plante_id
join jardin j
on s.jardin_id = j.id
join historique h
on t.id = h.entretien_id
where j.id = 1;

--Liste des entretiens effectués pour une plante spécifique--
select et.nom "Nom de l'entretien", 
    date(h.date) "Date de l'entretien"
from historique h
join entretien t
on h.entretien_id = t.id
join entretien_type et
on t.type_entretien_id = et.id
join plante p
on t.plante_id = p.id
where p.id = 1;

--Position de la section et le nombre de plantes dans chaque section--
select '(' || s.position_x || ',' || s.position_y || ')' "Position de la section", count(p.id) as "Nombre de plantes"
from section s
join plante p
on s.plante_id = p.id
join jardin j
on s.jardin_id = j.id
where j.id = 1
group by s.position_x, s.position_y;