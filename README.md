# Avalgard - Garden Management System

## Organisation / Situation
Avalgard est un système de gestion de jardin permettant aux utilisateurs d’optimiser leurs activités de jardinage. Le système repose sur une base de données relationnelle qui structure les informations liées aux plantes, aux sections de jardin, aux capteurs, et aux activités d’entretien. Cette approche permet une gestion précise et personnalisée de chaque jardin.

## Quelques Métriques
- ...

## Particularités de la Situation
La table Historique est central pour la planification des différents entretiens à réaliser sur les plantes. Grâce à la fréquence et à la date des entretiens réalisé nous pouvons déterminer un historique des entretiens effectués ansi qu'une planification des futures. Les capteurs jouerons égalment un rôle crucial afin de déterminer à quelle fréquence certaines tâches devront être effectuées.

## Challenges Attendues
- **Modélisation des besoins des plantes** : chaque plante a des exigences uniques (arrosage, température, etc.).
- **Optimisation des entretiens** : planification des tâche à réaliser à l'aide de la fréquence des entretiens.

## Aspects Modélisés / Non Modélisés
- **Modélisés** :
  - Gestion des plantes et de leurs sections associées.
  - Suivi des activités d’entretien et des historiques.
  - Intégration des climats pour ajuster les recommandations.

## Familiarité et Motivation
Nous avons choisi ce thème, car dans le cadre du cours de génie logiciel, nous devons réaliser une web app sur la gestion de jardin.

## Données Disponibles
Les données sur les plantes (humidité, fréquence d'arosage, information de la plante, etc...) sont facilement trouvable sur internet.
