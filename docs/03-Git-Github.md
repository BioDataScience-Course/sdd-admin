# Git & Github {#git}



Nous utilisons abondamment et enseignons l'usage de git et Github dans le cadre de nos cours de **Science des Données Biologiques** à l'UMONS. De plus, nous utilisons Github Classroom pour gérer la distribution des travaux aux étudiants sous forme de dépôts Github. Cette section couvre ces logiciels.

## Installation Git et cie

Dans la SciViews Box, git, Github Desktop et RStudio server (incluant une interface vers git) sont préinstallés. Hors machine virtuelle, il faut installer git, [RStudio](https://rstudio.com/products/rstudio/download/#download) et [Github Desktop](https://desktop.github.com/). Le reste se fait en interagissant avec Github via le navigateur web.

## BioDataScience-Course

L'organisation [BioDataScience-Course](https://github.com/BioDataScience-Course) regroupe tous les dépôts Github relatifs à nos cours, y compris les travaux des étudiants.

### Convention de noms

Comme l'organisation contient plusieurs centaines de dépôts, il est utile de les nommer correctement pour s'y retrouver. Les dépôts créés via Github Classroom seront traités plus loin. Voici quelques règles\ :

- Les dépôts important (matériel pédagogique, gestion des étudiants et de leur progression, ...) commencent tous par `sdd`. Pour les dépôts moins importants ou de test, utiliser un autre préfixe.

- Lorsqu'un dépôt est relatif à une cohorte d'étudiants en particulier, nous l'indiquons par un suffixe reprenant les deux derniers chiffres de l'année initiale, suivi de `m` pour les étudiants montois et `c` pour les étudiants de Charleroi. Par exemple, `sdd_students19m` concerne la cohorte d'étudiants montois inscrits en premier cours (Bab2 de biologie) en 2019-2020. De même `sdd_students20c` concerne la cohorte d'étudiants de Charleroi inscrits en Bab2 en 2020-2021.


## Github Classroom

Nous utilisons [Github Classroom]() pour générer la distribution des travaux aux étudiants sous forme de dépôts Github.

TODO: Guyliann: les éléments importants de la gestion de Github Classroom sont à présenter ici...

TODO: intégration de Github Classroom avec Moodle, voir https://classroom.github.com/help/setup-moodle & https://classroom.github.com/help/import-roster-from-lms.

\BeginKnitrBlock{note}<div class="note">Une autre ressource intéressante dans le contexte de l'utilisation de Github/Github Classroom pour l'enseignement est [Github Education](https://education.github.com).</div>\EndKnitrBlock{note}

## Astuces Git et Github

Quelques astuces qui nous sont utiles...

- Comparaison de branches sur Github\ : ajouter `/compare` à la fin de l'URL du dépôt et une page de comparaison de branche apparait. sinon, cette comparaison est aussi possible dans Github Desktop (menu `Branch -> Compare to Branch`).

- Lorsqu'une branche n'est plus utile, elle peut être facilement éliminée depuis Github Desktop (entrée de menu `Branch -> Delete...`). Cette branche doit être activée d'abord, et tous les commits doivent avoir été pushés. Il est conseillé d'éliminer la branche sur le serveur en même temps que la branche locale.

![La boite de dialogue d'élimination d'une branche dans Github Desktop.](images/git/git-delete-branch.png)
