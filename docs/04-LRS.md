# Learning record store {#lrs}



Un "[Learning Record Store](https://xapi.com/learning-record-store/)" (LRS en abbrégé) est une base de données un peu particulière configurée pour stocker toutes les données relatives au système d'apprentissage dans un format spécifique nommé [xAPI](https://xapi.com). Ce dernier format permet d'interconnecter différents systèmes qui produisent ou qui consomment des données entre eux. Il existe de nombreux outils payants [Learning Locker](https://learningpool.com/solutions/learning-locker-community-overview/), [Watershed LRS](https://www.watershedlrs.com),  ou gratuits tel [SCORM Cloud LRS](https://rusticisoftware.com/products/scorm-cloud/lrs/?_ga=2.47789487.923837694.1641462138-1391329406.1641462138) ou [TRAX LRS](https://traxlrs.com) pour gérer ce type de base de données. Ces outils [assurent la compatibilité nécessaire](https://adopters.adlnet.gov/products/all/0).

**Note\ : il existe aussi un autre (ancien) standard en plus de xAPI nommé SCORM. Une initiative cmi5 vise à fusionner les deux et à fournir une interface standardisée pour interopérer des outils diffé&rents au sein d'un "Learning Management System" (LMS) hétérogène. En gros, cmi5 = xAPI + LMS, [voir P.27 ici](https://adlnet.gov/assets/uploads/cmi5%20Best%20Practices%20Guide%20-%20From%20Conception%20to%20Conformance.pdf).**

## Notre "LRS"

Les évènements que nous enregistrons ne sont pas tous formatés en xAPI pour le moment. Ainsi, les données provenant de H5P le sont, mais pas celles provenant de Learnr, Shiny, ou Wooclap ne le sont pas. Nous avons décidé d'un format commun de table qui regroupe toutes ces données dans une base de données MongoDB. Plus tard, ce format pourra éventuellement évoluer vers un autre qui soit conforme à xAPI et qui puisse être utilisé dans un véritable LRS.

Le choix de MongoDB a été motivé par plusieurs facteurs\ :

- La possibilité d'utiliser gratuitement MongoDB ATLAS, un serveur sécurisé et fiabilisé contre les pannes sur le cloud pour y stocker (temporairement) jusqu'à 512Mo de données.

- La facilité d'installer un serveur MongoDB local uniquement (machine personnelle et RStudio Connect).

- La simplicité de backup/restauration de données pour un même serveur ou entre serveurs avec `mongodump`/`mongorestore`.

- La facilité d'exportation des données avec `mongoexport`, ainsi que les drivers pour PHP (Wordpress/H5PxAPIKatchu) et pour R avec le package {mongolite}.

- La rapidité de requêtes relativement complexes, et la possibilité de mettre au point de telles requêtes avec MongoDB Compass.

Par contre, au niveau des points négatifs, nous avons\ :

- Utilisation d'un port particulier 27017 qui doit être ouvert. À l'UMONS ce port est fermé pour certains réseaux (Wifi étudiant) car il est aussi contenu dans une plage utilisée par des jeux. Or, il est nécessaire de limiter l'accès aux jeux sur le réseau du campus car sinon, cela saturerait la bande passante.

- Pas de possibilité d'utiliser un outil comme {dbplyr} pour définir les requêtes. Langage de requêtage spécifique.

- Plus complexe à déployer et utiliser en local que SQLite.

- Des solutions plus performantes et mieux intégrées à R et Python existent comme Spark au RAPIDS/BlazingSQL.

- Il faut utiliser un format de données différtent pour l'échange et la publication des données (Open Data).

Nous ne sommes donc pas définitivement fixés sur cette solution, mais elle a le mérite de fonctionner correctement jusqu'ici.

### Vue générale

- Création d'un compte MongoDB ATLAS, une organisation UMONS et un serveur M0 SDD-COURS. Deux bases de données sont créées\ : "test" et "sdd". La première ne contient rien d'important et sert... à des tests comme son nom l'indique. La seconde contient nos données avec les collections "h5p", "learnr" et "shiny".

- Création d'un serveur local uniquement sur sdd.umons.ac.be qui contient la base de données "sdd", et des tables "users", "h5p", "learnr", "shiny", ... Également, mise en place de scripts cron (voir plus loin) pour récupérer les données venant de MongoDB ATLAS toutes les 5min et pour faire des bakcups journaliers de la base de données.

- Utilisation d'un serveur MongoDB local sur une machine sous Windows ou MacOS avec un snapshot des données obtenu via `mongodump`/`mongorestore`. Ce sbnapshot, ainsi ques les programmes nécessaires pour l'utiliser sous MacOS et Windows est partagé via p-Cloud.

Ces trois systèmes sont détaillés ci-dessous.

### MongoDB ATLAS

TODO: expliquer l'organisation de MongoDB ATLAS...

### Serveur MongoDB local associé à RSConnect

TODO: installation et configuration dans sdd.umons.ac.be

### Serveur local MacOS ou Windows

Le principe de cet item est de regrouper dans un dossier tous les programmes et toutes les données relatives à un snapshot donné de notre LRS, afin de pouvoir manipuler tout cela de manière indépendante et sécurisée (accès local uniquement). Le dossier de base contient deux sous-dossiers\ : `bin` et `db`.

Le dossier `bin` contient tous les exécutables MacOS et Windows nécessaires, soit `mongod` et `mongo` de la distribution 4.4.11 de MongoDB, et `bsondump`, `mongodump`, `mongoexport`, `mongofiles`, `mongoimport`, `mongorestore`, `mongostat` et `mongotop` des MongoDB Data Tools version 100.5.1. Ces versions sont choisies identiques à celles déployées sur sdd.umons.ac.be et la version majeure de MongoDB est alignée sur celle déployées sur MongoDB ATLAS^[Aligner les versions majeurs de MongoDB avec MongoDB ATLAS nécessite de jongler un peu avec les mises à jour car nous n'avons aucuns contrôles des versions sur ATLAS. Par exemple, une migration de 4.4 vers 5.0 a été plannifiée début février 2022 et nous devons adapter tout le reste au même moment\ !]. Ces différents exécutables sont récupérés depuis les installeurs (format .tgz ou .zip) MacOS et Windows depuis [MongoDB on-premises](https://www.mongodb.com/try/download/community) et [MongoDB tools](https://www.mongodb.com/try/download/database-tools). L'ensemble de ces exécutables MacOS et Windows occupent un peu plus de 1Go dans le dossier `bin`.

Le dossier `db` contient le snapshot de la base de données. Il est créé en réalisant un `mongorestore` à partir des données obtenues par `mongodump` depuis sdd.umons.ac.be comme ceci (exemple sous MacOS)\ :

```
# On sdd.umons.ac.be, go to a emty folder, say '/data1/dump/sdd', then:
mongodump # Possibly restrict with --collection=<col_name> and/or --query='{"x": {"$gt":1}}'
# Compress this folder
cd ..
tar -czvf sdd.tar.gz sdd
rm -rf sdd
# Go back to your local machine, then:
cd <empty_temporary_dir>
scp econum@sdd.umons.ac.be:/data1/dump/sdd.tar.gz sdd.tar.gz # Enter password...
tar -xzvf sdd.tar.gz
rm sdd.tar.gz
cd ..
<path_to>/mongorestore # Of course, the local MongoDB server must be running here
```

En plus de ces deux sous-dossier, il y a également deux scripts qui permettent de lancer le serveur MongoDB sous MacOS ou sous Windows. Ces scripts sont\ :

- `sdd_server_macos.sh`\ :

```
#!/bin/bash
cd "$(dirname "$0")"
port=27017
./bin/mongod --port $port --dbpath db
```

- `sdd_server_win.bat`

```
@echo off
set port=27017
start cmd /c bin\mongod --port %port% --dbpath db
```

Ces deux scripts sont à exécuter dans un terminal MacOS ou une fenêtre Powershell Windows après avoir changé le répertoire par défaut vers le dossier racine\ :

```
cd <dossier_racine>
./sdd_server_macos.sh ou ./sdd_server_win.bat
```

TODO: Un script qui remplit le sous-dossier `bin` en fonction du système, et qui traite aussi le cas Linux Ubuntu.

Et ainsi un démon MongoDB serveur local est lancé sur le port 127.0.0.1:27017 et sert les données présentes dans le sous-dossier `db`. Les messages du serveur sont directement affichés dans la fenêtre terminal. À partir de ce moment, on peut travailler tranquillement sur les données, les analyser et/ou prototyper des outils à déployer ensuite sur sdd.umons.ac.be sans craintes de casser la base de données principale. Ce serveur ne permet qu'un accès local. Donc, il est parfaitement sécurisé.

**Note\ : Les versions du serveur et des outils doivent toujours être les mêmes que celles sur MongoDB ATLAS et sdd.umons.ac.be. En cas de changement de version, il faut donc bien penser à remplacer les exécutables du dossier `bin` par les nouvelles versions avant de continuer à travailler\ !**

Pour échanger ce snapshot et ces outils entre ordinateurs, le dossier racine et son contenu peuvent être compressés (zippé) et partagés via le dossier `Crypto Folder` de p-Cloud. **Ne pas exécuter le serveur MongoDB directement depuis le dossier p-Cloud pour des raisons évidentes de perfomances**, mais copier le fichier et le dézipper sur un disque dur rapide qui contient suffisamment de place (5Go au moins).

### Mise-à-jour de MongoDB

La version de MongoDB serveur est dictée par celle installé dans MongoDB ATLAS. Par exemple, en février 2022, la version change de 4.4 à 5.0 et il faut adapter tous les outils en fonctions. Voici les étapes à réaliser\ :

- Vérification de la compatibilité du driver PHP dans Wordpress et upgrade éventuel (voir la section sonsacrée à Wordpress). Ici, il a fallu passer de la version 1.6 à la version 1.9.

- Vérification de la compatibilité de {mongolite}. La version installée avec la SciViews Box 2021 est la 2.3.1, et il faut au moins la 2.4.1 donc dans R\ :

```
packageVersion("mongolite")
# If needed:
#remotes::install_github("jeroen/mongolite@v2.4.1")
```

- Vérification de l'option "featureCompatibilityVersion" qui doit être mise à 4.4 (nous voulons pour l'instant rester compatible avec l'ancien sans utiliser les fonctions nouvelles de MongoDB 5.0), donc dans R\ :

```
library(mongolite)
# Start the local server, then... check featureCompatibilityVersion (4.4)
admin <- mongo(url = "mongodb://127.0.0.1:27017/admin")
admin$run('{ "getParameter": 1, "featureCompatibilityVersion": 1 }')
# If it is lower than 4.4, check first upgrade recommandations, then
#admin$run('{ "setFeatureCompatibilityVersion": "4.4" }')
```

- Mettre à jour les versions de MongoDB Tools. Il nous faut la version 100.5.1 qui est déjà celle installée dans sdd.umons.ac.be. Faire cet upgrade sur les versions locales aussi.

- Tester la compatibilite MongoDB 5.0 sur une version locale de la base de données et y exécuter les différents outils.

- Le jour où MongoDB ATLAS passe sur MongoDB 5.0, installer les exécutables MongoDB 5.0 dans sdd.umons.ac.be ey les versions locales de MongoDB partout.


## Learning Analytics Platform

Le stockage des données est une première étape. Il faut ensuite avoir des outils qui digèrent, analysent et présentent ces données sous des formes utiles pour l'enseignant. Ce sont les "Learning Analytics Platforms" (LAP). Nous développons de tels outils pour notre plateforme en utilisant R et {Shiny}. TODO: suite...
