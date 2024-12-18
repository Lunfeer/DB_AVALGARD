Select p.nom "Nom de la plante", 
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

select count(p.id) as "Nombre de plante"
from plante p
join section s
on p.id = s.plante_id
join jardin j
on s.jardin_id = j.id
join utilisateur u
on j.utilisateur_id = u.id
where u.id = 1;

select c.nom
from capteurs c
join section s
on c.section_id = s.id
join jardin j
on s.jardin_id = j.id
where j.id = 1;

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