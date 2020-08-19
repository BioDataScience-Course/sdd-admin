# Git & Github {#git}



Nous utilisons abondamment et enseignons l'usage de git et Github dans le cadre de nos cours de **Science des Données Biologiques** à l'UMONS. De plus, nous utilisons Github Classroom pour gérer la distribution des travaux aux étudiants sous forme de dépôts Github. Cette section couvre ces logiciels.

## Installation Git et cie

Dans la SciViews Box, git, Github Desktop et RStudio server (incluant une interface vers git) sont préinstallés. Hors machine virtuelle, il faut installer git, [RStudio](https://rstudio.com/products/rstudio/download/#download) et [Github Desktop](https://desktop.github.com/). Le reste se fait en interagissant avec Github via le navigateur web.

## BioDataScience-Course

L'organisation Github [BioDataScience-Course](https://github.com/BioDataScience-Course) regroupe tous les dépôts relatifs à nos cours, y compris les travaux des étudiants.

### Convention de noms

Comme l'organisation contient plusieurs centaines de dépôts, il est utile de les nommer correctement pour s'y retrouver. Les dépôts créés via Github Classroom seront traités plus loin. Voici quelques règles\ :

- Les dépôts important (matériel pédagogique, gestion des étudiants et de leur progression, ...) commencent tous par `sdd` lorsque ces dépôts sont utilisés en interne (ex.\ : `sdd_lesson`, `sdd_movies`, `sdd-admin`, ...)^[Au départ, nous avons omis de déterminer si `sdd` devait être suivi du trait souligné `_` ou du tiret `-`. Résultat\ : nous rencontrons maintenant les deux formes dans nos dépôts `BioDataScience-Course`.]. Les dépôt concernant des items publics peuvent aussi utiliser `BioDataScience` comme préfixe pour être plus explicite (ex.\ : `BioDataScience1`, `BioDataScienceData`, `BioDataScienceExam`, ...). Pour les dépôts moins importants ou de test, utiliser un autre préfixe.

- Lorsqu'un dépôt est relatif à une cohorte d'étudiants en particulier, nous l'indiquons par un suffixe reprenant les deux derniers chiffres de l'année initiale, suivi de `m` pour les étudiants montois et `c` pour les étudiants de Charleroi. Par exemple, `sdd_students19m` concerne la cohorte d'étudiants montois inscrits en premier cours (Bab2 de biologie) en 2019-2020. De même `sdd_students20c` concerne la cohorte d'étudiants de Charleroi inscrits en Bab2 en 2020-2021.


## Github Classroom

Nous utilisons [Github Classroom](https://classroom.github.com/classrooms) pour générer la distribution des travaux aux étudiants sous forme de dépôts Github.


Github Classroom se lie à une organisation Github. Il permet de réaliser différentes classes afin d'organiser les cohortes d'étudiants. Les conventions de noms sont similaire aux convention présentée précédemment. Par exemple, la classe sdd1-19m correspond au cours de Science des données biologiques I donné aux étudiants montois de l'année académique 2019-2020. 

Au sein de chaque classe, il est possible de créer des exercices individuels ou par groupe que l'on nomme des assignations (*assignment* en anglais). Chaque nom d'assignation débute par le code lié à la classe. Cette nomenclature permet un gestion simplifié de l'organisation sur Github. Par exemple, l'assignation `sdd2-20m-mod8` porte sur un exercice ciblé sur le module 8 du cours de science des données biologiques 2 pour les étudiants montois suivant ce cours durant l'année académique 2020-2021. Si le dépôt est complexe et porte sur plusieurs modules, il portera un nom lié au travail comme `sdd2-20m-biometry`. 


Les exercices peuvent employer un dépôt template afin de guider les étudiants. Nous fournissons toujours un dépôt template pour nos exercices. Un dépôt template est un dépôt Github reconnu comme *Template repository* sur Github (ce paramètre est sélectionnable dans les paramètres du dépôt). 

Parmi les paramètres important de l'exercice, il est important de spécifier si le dépôtt est privée ou public.

Un lien url est fourni pour chaque exercice afin d'inviter les étudiants à rejoindre l'exercice. Pour les exercices individuels, Github Classroom va créer un dépôt généré à partir du dépôt template dans l'organisation BioDataScience portant le nom de l'exercice suivi du nom d'utilisateur Github de l'étudiant ( sdd2-20m-mod8-GuyliannEngels). Les travaux de groupe portent le nom de l'exercice suivi du nom du groupe.


Github Classroom est en évolution constant. De nouvelles fonctionnalités apparaissent régulièrement afin d'améliorer la gestion des classes et des exercices. Il développe par exemple l'[intégration de Github Classroom avec Moodle](https://classroom.github.com/help/setup-moodle). 


Github Classroom propose également l'application [GitHub Classroom Assistant](https://classroom.github.com/assistant) afin de télécharger l'ensemble des dépôts lié à un exercice dans un dossier de notre choix.


\BeginKnitrBlock{note}<div class="note">Une autre ressource intéressante dans le contexte de l'utilisation de Github/Github Classroom pour l'enseignement est [Github Education](https://education.github.com).</div>\EndKnitrBlock{note}

## Astuces Git et Github

Quelques astuces qui nous sont utiles...

- Comparaison de branches sur Github\ : ajouter `/compare` à la fin de l'URL du dépôt et une page de comparaison de branche apparait. Sinon, cette comparaison est aussi possible dans Github Desktop (menu `Branch -> Compare to Branch`).

- Lorsqu'une branche n'est plus utile, elle peut être facilement éliminée depuis Github Desktop (entrée de menu `Branch -> Delete...`). Cette branche doit être activée d'abord, et tous les commits doivent avoir été pushés. Il est conseillé d'éliminer la branche sur le serveur en même temps que la branche locale.

![La boite de dialogue d'élimination d'une branche dans Github Desktop.](images/git/git-delete-branch.png)
