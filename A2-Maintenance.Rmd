# Maintenance {#maintenance}

Le système dans son ensemble est complexe et nécessite évidemment un minimum de maintenance. Les différentes opérations sont listées ici.

## Maintenance régulière

TODO...

## Nettoyage à la fin de chaque cours

En aout et en janvier, une maintenance supplémentaire est nécessaire pour préparer respectivement au premier quadrimestre de l'année académique suivante et au second quadrimestre de la même année. Les opérations suivantes sont à réaliser\ :

- Vérifier le bon fonctionnement et la mise à jour de toutes les composantes.

- Contrôle de la table des utilisateurs dans WordPress + dernière exportation et importation dans p-Cloud et dans la base de données MongoDB de sdd.umons.ac.be

- Élimination des comptes d'utilisateurs arrivés en fin de cursus

- Nettoyage et pesudonymisation des dépots GitHub relatifs aux étudiants arrivés en fin de cursus dans l'espace BioDataScience-Course (TODO\ !!!)

- Backup de données H5PxApiKatchu éventuelles et nettoyage de ces données

- Backup complet du site WordPress avec UpdraftPlus

- Récupération d'un snapshot de WordPress dans p-Cloud

- Récupération d'un backup de la base de données MySQL dans p-Cloud. Aller dans phpMyAdmin, exporter au format .sql (quick) dans /srv/data/tmp. Ensuite, récupérer le fichier, le zipper et le placer sur p-Cloud pour archivage

- Update éventuel WordPress après ces backups (PHP et/ou MySQL)

- Vérification de la synchronisation entre MongoDB ATLAS et MongoDB sdd.umons.ac.be et nettoyage des tables h5p, shiny et learnr sur MongoDB ATLAS

- Récupération et nettoyages des backups MongoDB depuis sdd.umons.ac.be et réalisation d'un snapshot local archivé sur p-Cloud. Pour récupérer les données entre deux dates seulement\ : `mongodump --query "{\"ts\":{\"\$gt\":{\"\$date\":`date -d 2011-08-10 +%s`000},\"\$lte\":{\"\$date\":`date -d 2011-08-11 +%s`000}}}"`

- Récupération d'une copie des différentes bases de données SQLite liées aux challenges, et élimination de ces bases de données depuis sdd.umons.ac.be à la fin de chaque année académique. `sudo tar -czvf backup/challenges.tar.gz A04_challenge B04_challenge C03_challenge`, then from a local machine\ : `scp econum@sdd.umons.ac.be:/data1/backup/challenges.tar.gz challenges.tar.gz`

- Mise à jour et vérification logicielle et matérielle de sdd.umons.ac.be

- Changement de tous les mots de passe et génération de nouveaux fichiers cryptés avec les informations de connexion (en début d'année académique uniquement)

- Remise à zéro de tous les flags d'utilisateurs dans WordPress


