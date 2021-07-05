# Rapport de progression {#progression}



Un des gros problèmes des cours en classes inversées est d'arriver à **stimuler** les étudiants à faire le travail chez eux. Livrés à eux-mêmes, seulement un pourcentage trop faible d'entre eux va réaliser le travail demandé à domicile. Évidemment, c'est également préjudiciable au travail en classe, si ce dernier part du principe que la matière hors présentiel est censée être vue. Et si des travaux de groupe (conseillé) sont prévus, ceux qui n'ont rien fait apparaitront comme des boulets pour les autres.

\BeginKnitrBlock{warning}
En parallèle au déploiement du matériel d'e-learning hors présentiel, nous devons mettre également en place des outils pour permettre à l'étudiant de suivre sa progression d'apprentissage, et aussi pour le stimuler dans cet auto-apprentissage.
\EndKnitrBlock{warning}

Les outils qui peuvent être mis en place sont\ :

- *Pénalisation si le travail n'est pas fait*. Il faut arriver à déterminer ici objectivement si le travail est fait ou pas. Le plus simple est d'interroger les étudiants en début de chaque classe en présentiel, **mais cela prend du temps et n'est pas très constructif**\ ! Cette approche n'est donc pas conseillée. 

La vidéo suivante explique d'ailleurs pourquoi le coercitif ne fonctionne pas bien et pourquoi il faut plutôt **valoriser le travail effectué** plutôt que de punir s'il n'est pas fait. Il faut aussi **une récompense immédiate**, et favoriser l'**émulation individuelle** (se dépasser soi-même), et **de groupe** (se comparer à la progression générale de la classe).


\begin{center}\href{https://www.youtube.com/embed/xp0O2vi8DX4}{\includegraphics{10-Progression_files/figure-latex/unnamed-chunk-2-1} }\end{center}

Les aides et encouragements au travail que nous avons mis en place de manière utile sont\ :

- L'*émulation personnelle* au travers de points reçus si l'on fait tous les exercices (les badges, et la "gamification" en général de l'apprentissage sont également à considérer sérieusement dans ce contexte),

- La *valorisation d'un comportement ou d'un résultat positif au delà de la moyenne*  à l'aide de points bonus (on est toujours dans la gratification et la gamification ici),

- Montrer que nous (en qualité d'enseignants), nous nous *intéressons réellement à leur travail*. Cela tient à des petits détails\ : des retours sous forme de courts commentaires, des relances, des questions, des encouragements, la reconnaissance de leurs progrès, ...

- l'*entre-aide*, faire expliquer les points difficiles par un collègue qui les ont compris est extrêmement efficace. En plus, cela permet de mitiger un aspect difficile à gérer\ : la différence de vitesse d'apprentissage entre les "bons" et les "mauvais" étudiants (non, il n'y a pas de bons et de mauvais étudiants, nous le savons, il y a juste des étudiants avec des facultés et des motivations différentes... mais certains sont quand même beaucoup plus lents et **énervants** que d'autres). Au lieu de se tourner les pouces, demander à ceux qui ont fini en avance d'expliquer aux autres permet d'utiliser efficacement le temps et les ressources humaines en classe.

- Les *travaux de groupes*, les *challenges* (par exemple, les étudiants doivent reproduire un graphique difficile), les *compétitions* (une course contre le temps et/ou entre plusieurs groupes pour résoudre un problème) participent efficacement à dynamiser le travail en classe et à varier les activités.

- L'utilisation des *réseaux sociaux* pour communiquer. Le forum de Moodle est peu ou pas utilisé du tout. Les issues de GitHub, une fois que les étudiants ont appris à les utiliser, s'avèrent utiles car elles sont disponibles près du dépôt lui-même qui contient les exercices. Mais ce qui fonctionne le mieux (testé en période de confinement Covid-19), c'est *Discord* parce que beaucoup d'étudiants connaissent et utilisent déjà pour les jeux. Le ton des échanges y est d'ailleurs plus décontracté (parfois nettement plus), mais cela reste un outil efficace pour aider un étudiant qui est bloqué dans sa progression.

- Les étudiants sollicitant une *aide plus directe* apprécient de pouvoir poser leurs questions par email. Afin de pouvoir être plus réactif, nous avons mis en place une adresse `sdd@sciviews.org` pour laquelle tous les enseignants du cours ont accès. Ainsi, les interventions peuvent être partagées et plus rapides.

- Pour obtenir un *retour plus direct* par rapport aux activités, nous mettons progressivement en place le **rapport de progression**. Les actions de l'étudiant dans les learnrs (et dans un second temps également H5P et les apps Shiny) sont enregistrées dans une base de données MongoDB. Le rapport de progression est une app Shiny qui collecte, nettoies, prépare, et présente graphiquement la progression de l'étudiant. L'*émulation de groupe* est obtenue en comparant la progression de l'étudiant à la progression générale de la classe.

Afin d'avoir un retour immédiat, nous souhaitons rendre ce rapport de progression dynamique de sorte qu'il montre l'évolution en temps réel. Il est en effet important que l'étudiant puisse visualiser sur son rapport qu'il vient d'avancer en achevant à la seconde un exercice\ ! De plus, nous souhaitons associer cela à des récompenses sous forme de **badges** lorsque l'étudiant franchit une étape dans son apprentissage (aussi, des badges spéciaux pourraient être associés aux points bonus). La gestion des badges a été abordée dans la section dédiée à Moodle (voir chapitre \@ref(moodle)).

## Présentation générale

L'app Shiny de rapport de progression est développée dans le dépôt GitHub privé [sdd_progress-report](https://github.com/BioDataScience-Course/sdd_progress-report). Comme il contient du code sensible, il n'est pas disponible de manière publique. Par contre, les enseignants du cours y ont accès. Le fichier `README.md` du dépôt détaille son fonctionnement et contient du code pour le tester.

Cette app Shiny est ensuite intégrée dans Moodle via un lien URL qui ouvre l'app dans une fenêtre interne et lui passe des paramètres issus de Moodle (identité de l'étudiant, cours correspondant) afin de déterminer quel rapport il faut présenter.

## Les données

Nous utilisons MongoDB comme système de stockage de nos données. Ce type de base de données permet de stocker des données semi-structurées qui correspond bien à ce les évènements xAPI renseignent. Par sécurité, une base de données MongoDB *locale* est créée sur sur le serveur RStudio Connect. Elle n'est pas disponible depuis l'extérieur. Donc, seules les applications exécutées à partir de RStudio Connect y ont accès. Par contre, cela ne permet pas d'enregistrer les données générées ailleurs (H5P, applications learnr ou shiny exécutées dans la SciViews box, ...). Ainsi, nous déployons une seconde base MongoDB sur le cloud via MongoDB ATLAS. Cette dernière sert uniquement à collecter *transitoirement* les données externes au serveur. Ensuite, un script sur RStudio Connect est exécuté à intervalle régulier pour rapatrier ces données externes dans la base de données interne.

Une autre solution aurait été d'ouvrir la base de données associée à notre serveur RStudio Connect, mais la solution à deux points d'accès offre les avantages suivants\ :

- Sécurité maximale des données une fois rapatriées dans la base sur le serveur
- Duplication des points d'accès (et MongoDB ATLAS utilise 3 serveurs différents sur le cloud) afin de garantir que les données puissent toujours être récoltées, même si le serveur RStudio Connect ne répond plus

### Base interne

TODO: expliquer l'installation et le fonctionnement de la base MongoDB interne.

A des fins de test et développement, la base de donnée interne MongoDB peut être ouverte transitoirement. Sur le serveur RStudio Connect, le port de MongoDB 27017 est ouvert dans les deux sens. Ainsi, il est possible de se connecter depuis RStudio Connect vers MongoDB ATLAS pour en récupérer les données d'une part, et il est aussi possible de modifier temporairement le fichier de configuration de MongodB local pour permettre un accès externe lors de la mise au point des applications Shiny qui doivent y accéder.

Ce fichier de configuration est `/etc/mongodb.conf` et il contient. Pour modifier sa configuration transitoirement, nous pouvons nous y connecter via VPN UMONS (`ssh econum@sdd.umons.ac.be` avec mot de passe econum classique), et ensuite\ :

```
sudo nano /etc/mongodb.conf
# Editer la ligne bindp: 127.0.0.1 en bindp: 127.0.0.1,193.190.194.75
# Ensuite Ctrl-X + Y(es)
# Enfin, redémarrer le service MongoDB
sudo systemctl restart mongodb
```

Pour tester l'accès\ :

```
# Accès en local (il faut succeeded!)
nc -zv 127.0.0.1 27017
# Accès distant
nc -zv 193.190.194.75 27017
# En local pour déterminer l'état du port 27017
netstat -pano | grep 27017
```

On peut aussi directement tester l'accès à la base MongoDB avec les outils en ligne de commande installés depuis un ordinateur distant comme ceci\ :

```
mongo "mongodb://193.190.194.75:27017"
db
quit()
```

Pour refermer le port, on fait l'opération inverse\ : limiter `bindp= 127.0.0.1` seulement dans le fichier de configuration.

### Base externe

TODO: expliquer l'installation et le fonctionnement de la base MongoDB externe. Deux comptes: **sdd** avec des droits limité uniquement en écriture pour l'introduction des données et **sdd-teacher** avec des droits en lecture et écriture.

### Gestion des utilisateurs

Nous récupérons les informations provenant de Wordpress concernant les utilisateurs. Ensuite, le rapport de progression est affiché dans un iframe en fonction des données issues de Moodle, y compris `iref` qui est la référence interne à Moodle et qu'il est impossible de deviner par ailleurs (en effet, les autres données nom, email, cours, etc. pourraient être devinées et un tier pourrait visualiser le rapport de progression d'un étudiant sans son consentement... sauf qu'il lui faut aussi `iref` qui joue donc garde-fou ici).

La récupération des données des utilisateurs est détaillée dans le dépôt privé `sdd_student_2020`. En 2020-2021, nous avons un bug qui fait que les données Moodle ne sont pas forcément enregistrées comme métadonnées dans Wordpress si l'utilisateur ne va pas sur Moodle *après* avoir entré son login GitHub. Ce problème devra être réglé plus tard, mais pour l'instant, nous avons demandé à tous les étudiants d'effectuer cette opération (il suffit de la faire une seule fois). Un problème subsiste cependant pour les étudiants en passerelle qui suivent deux cours, car l'entrée `icourse` ne peut contenir qu'une seule valeur. Nous devons donc résoudre ce problème avec du code spécifique R... mais ce sera à revoir pour une version ultérieure.


### Format des données

A partir de 2020, avec l'apparition de {learnitdown}, nous diversifions l'offre d'exercices enregistrés. Préalablement, il s'agissait uniquement de learnr exécutés dans la SciViews Box. A présent, les H5P et les applications Shiny peuvent également être enregistrées.

Afin d'éviter la multiplication des formats de données, nous avons donc homogénéisé leur présentation entre les différentes applications dans {learnitdown}. Ces données sont toutefois enregistrées dans des collections différentes (**h5p**, **learnr** et **shiny**) dans la base **sdd**. Chaque entrée contient les champs suivants\ :

- **_id:** C'est l'identifiant unique du document MongoDB attribué automatiquement lors de l'insertion de chaque entrée

- **session:** La session à partir de laquelle l'évènement a été généré. Cette information est surtout utile pour les applications Shiny. Pour H5P, c'est un identifiant complémentaire de l'utilisateur enregistré qui est indiqué. Le plus souvent du type `email: mailto:user@site.com`, mais pas forcément. Pour l'instant, les learnr n'introduisent rien dans ce champ.

- **date:** La date au format GMT à laquelle l'évènement a été généré. Cette date est enregistrée à la microseconde près, mais la résolution est inférieure (probablement 50 à 150µsec, sauf pour les applications Shiny où le temps est comptabilisé à la milliseconde près).

- **id:** Uniquement pour H5P, l'identifiant du widget, le numéro à rentrer dans le shortcode, par exemple, `[h5p id="3"]` pour l'item 3.

- **app:** L'identifiant textuel de l'application, voir convention pour le nom des applications ci-dessous.

- **version:** Le numéro de version pour les apps Shiny et learnr. Les applications H5P n'ont malheureusement pas de numéro de version. Ce champ contient donc `null` dans ce cas, sauf s'il s'agit d'un "sous-contenu" (voir convention de noms d'apps ci-dessous), dans ce cas, nous aurons l'identifiant du sous-contenu.

- **user:** Utilisateur actuel sur la machine où l'application s'exécute.

- **login:** Login GitHub/Wordpress de l'utilisateur (peut être le même ou différent de **user**).

- **email:** Adresse mail institutionnelle (valeur passée par Moodle dans `iemail`). Pour les applications H5P, l'email Wordpress est resigné généralement dans session, s'il a été défini. Pour les applications Shiny, l"identification complète de l'utilisateur, y compris son email Wordpress se retrouve dans le champ **data** pour l'évènement **started**.

- **course:** Le cours que suit l'étudiant, sous forme de l'identifiant Moodle (ex.: `S-BIOG-006`).

- **institution:** Nom de l'institution où l'étudiant est enrolé.

- **verb:** Le verbe xAPI correspondant à l'évènement (voir ci-dessous verbes xAPI).

- **correct:** `"TRUE"` ou `"FALSE"` uniquement pour les évènement correspondant à des réponses à une question, donc les verbes **answered** (pour les questions) ou **submitted** (pour du code R). Dans les autres cas, sa valeur est `""`, sauf si une application Shiny a été lancée, mais sans que l'utilisateur ne clique jamais sur le bouton `Submit`. Dans ce cas, la valeur vaut `"NA"`.

- **score:** Nombre de points obtenus pour la question. Depend de l'application. Pour les H5P, il s'agit du nombre d'items corrects moins le nombe d'items erronés. Pour Shiny, c'est le nombre de widgets correctements positionnés par rapport au nombre testé dans la solution. Enfin pour learnr, c'est `0` ou `1` selon que la question est complètement correcte ou pas. Pas pertinent en dehors de réponses et donc ce champ vaut `null` dans ce cas.

- **max:** Score maximum pouvant être obtenu pour la question. Dépend du contexte. En dehors de réponses aux question, ce champ vaut `0`.

- **grade:** La fraction de bonne réponse, ou autrement dit, une note sur 1 pour la question. Si on a `1` la réponse est totalement correcte, mais si on a `0.5`, elle ne l'est qu'à moitié. En dehors de réponse à une question, ce champ n'a pas de sens et sa valeur est `null`.

- **label:** Le libellé de l'item générant l'évènement. Pour Shiny, c'est le nom du widget. Pour H5P, c'est le texte de laquestion, etc.

- **value:** La valeur sélectionnée pour le widget Shiny, ou la réponse donnée pour H5P, par exemple. Dépendant du contexte.

- **data:** Des données complémentaires sous forme d'une chaine de caractères contenant un objet JSON. Pour H5P, il s'agit de l'évènement xAPI généré. Pour learnr, il s'agit d'une partie du contenu (moins `correct` et `label` qui sont extraits dans les champs correspondant). Pour Shiny il s'agit d'informations complémentaires sur les widgets.

#### Convention de nom des apps

Nous avons potentiellement beaucoup d'applications H5P/Shiny/learnr réparties un peu partout dans les différents cours. Pour s'y retrouver, nous utilisons donc une convention de noms telle que nous pouvons déterminer rapidement à quelle partie de quel cours l'app se rattache. Cette convention est la suivante\ :

- Les noms commencent par `A00a_` avec\ :
    - La première lettre en majuscule correspondant au cours (`A` = SDD I, `B`= SDD II, etc.). Pour les applications non attribuées à des cours en particulier, nous utilisons `.` pour toutes les applications utilisées dans la présentation générale, et sinon, `Z` pour tout le reste.
    - Deux chiffres indiquant le module où se trouve l'app. On utilise `00` s'il n'y en a pas ou si elle apparait dans le prambule du bookdown, ou `99` pour une app apparaissant dans les appendices.
    - Une lettre minuscule servant à ordonner les applications d'un même module. Ceci est surtout utile pour les learnrs afin qu'ils apparaissent dans le bon ordre dans l'onglet 'Tutorials' de RStudio. Pour les autres, c'est utilisable mais non nécessaire. On peut aussi utiliser le point `.` pour ne rien spécifier ici.
    - Le trait souligné qui sépare le code d'identification du nom de l'application.

- Après le code, le nom de l'application doit être court et informatif. Séparer les mots par des tirets.
- Dans le cas particuliers des "sous-contenus" de H5P (des widgets à l'intérieur d'autres widgets, exemple\ : une question à choix multiple à l'intérieur d'une présentation ou une vidéo), on utilisera le même code et nom que le widget principal, suivi du slash et du nom attribué au sous-contenu. Par exemple, la question 1 dans une présentation pourrait s'appeler `B02a_présentation/question1` si la présentation est dans le cours SDD II (`B`), module 2 (`02`), première position `a`, et qu'elle se nomme elle-même `présentation`.

Le système de nommage des applications choisi est un peu compliqué, mais avec l'habitude, il permet d'identifier instantanément les données dans la base par rapport à leur contexte\ !

#### Verbes xAPI

Les évènements xAPI de H5P sont déjà décrits par des verbes. Par contre, les évènements Shiny ou learnr sont décrits via des dénominations propres. Afin d'homogénéiser le tout, nous avons décidé de traduire les évènements Shiny et learnr en verbes xAPI selon le tableau suivant\ :

| Verbe xAPI  | learnr                    | shiny         | H5P        | Remarque   |
|:------------|:--------------------------|:--------------|:-----------|:-----------|
| started     | session_start             | start         |            | L'utilisateur a démarré activement une application |
| attempted   |                           |               | attempted  | L'utilisateur arrive sur un H5P (différent de started) |
| exited      |                           | inputs/quit   |            | L'utilisateur quitte volontairement (différent de stopped) |
| stopped     | session_stop              | stop          |            | L'application s'est arrêtée |
| displayed   | section_viewed            |               |            | L'utilisateur visualise une section |
| progressed  | section_skipped           |               | progressed | L'utilisateur avance dans les exercices (différent de displayed) |
| seeked      | video_progress            |               |            | Progression dans une vidéo |
| interacted  |                           | inputs        | interacted | Dans Shiny: sauf boutons 'submit' & 'quit' |
| answered    | question_submission       |               | answered   | Réponse à une question (hors code R) |
| reset       | reset_question_submission |               |            | Nouvel essai après une réponse erronée |
| executed    | exercise_submission       |               |            | Bouton 'Run Code' dans learnr |
| evaluated   | exercise_result           |               |            | Résultat de l'évaluation du code R, si correct == ""  |
| submitted   | exercise_result           | inputs/result |            | Idem, mais si correct != "" dans learnr, Bouton Shiny 'submit'  |
| computed    |                           | outputs       |            | Par défaut, les outputs ne sont pas enregistrés dans Shiny |
| debugged    |                           | errors        |            | Erreur détectée dans une app Shiny  |
| assisted    | exercice_hint             |               |            | Sauf si dernier hint = réponse => revealed |
| revealed    | exercice_hint             |               |            | Pour les boutons 'solution' dans learnr & dernier 'hint' |
| completed   |                           |               | completed  | Dans H5P, un bilan général est calculé à la fin |

A noter que ces correspondances ont été établies sur base de la [définition des verbes xAPI](http://xapi.vocab.pub/verbs/index.html), ainsi que sur la liste des [évènements learnrs](https://rstudio.github.io/learnr/publishing.html). 
