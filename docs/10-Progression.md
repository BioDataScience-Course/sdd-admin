# Rapport de progression {#progression}



Un des gros problèmes des cours en classes inversées est d'arriver à **stimuler** les étudiants à faire le travail chez eux. Livrés à eux-mêmes, seulement un pourcentage trop faible d'entre eux va réaliser le travail demandé à domicile. Évidemment, c'est également préjudiciable au travail en classe, si ce dernier part du principe que la matière hors présentiel est censée être vue. Et si des travaux de groupe (conseillé) sont prévus, ceux qui n'ont rien fait apparaitront comme des boulets pour les autres.

\BeginKnitrBlock{warning}<div class="warning">En parallèle au déploiement du matériel d'e-learning hors présentiel, nous devons mettre également en place des outils pour permettre à l'étudiant de suivre sa progression d'apprentissage, et aussi pour le stimuler dans cet auto-apprentissage.</div>\EndKnitrBlock{warning}

Les outils qui peuvent être mis en place sont\ :

- *Pénalisation si le travail n'est pas fait*. Il faut arriver à déterminer ici objectivement si le travail est fait ou pas. Le plus simple est d'interroger les étudiants en début de chaque classe en présentiel, **mais cela prend du temps et n'est pas très constructif**\ ! Cette approche n'est donc pas conseillée. 

La vidéo suivante explique d'ailleurs pourquoi le coercitif ne fonctionne pas bien et pourquoi il faut plutôt **valoriser le travail effectué** plutôt que de punir s'il n'est pas fait. Il faut aussi **une récompense immédiate**, et favoriser l'**émulation individuelle** (se dépasser soi-même), et **de groupe** (se comparer à la progression générale de la classe).

<!--html_preserve--><iframe src="https://www.youtube.com/embed/xp0O2vi8DX4" width="770" height="433" frameborder="0" allowfullscreen=""></iframe><!--/html_preserve-->

Les aides et encouragements au travail que nous avons mis en place de manière utile sont\ :

- L'*émulation personnelle* au travers de points reçus si l'on fait tous les exercices (les badges, et la "gamification" en général de l'apprentissage sont également à considérer sérieusement dans ce contexte),

- La *valorisation d'un comportement ou d'un résultat positif au delà de la moyenne*  à l'aide de points bonus (on est toujours dans la gratification et la gamification ici),

- Montrer que nous (en qualité d'enseignants), nous nous *intéressons réellement à leur travail*. Cela tient à des petits détails\ : des retours sous forme de courts commentaires, des relances, des questions, des encouragements, la reconnaissance de leurs progrès, ...

- l'*entre-aide*, faire expliquer les points difficiles par un collègue qui les ont compris est extrêmement efficace. En plus, cela permet de mitiger un aspect difficile à gérer\ : la différence de vitesse d'apprentissage entre les "bons" et les "mauvais" étudiants (non, il n'y a pas de bons et de mauvais étudiants, nous le savons, il y a juste des étudiants avec des facultés et des motivations différentes... mais certains sont quand même beaucoup plus lents et **énervants** que d'autres). Au lieu de se tourner les pouces, demander à ceux qui ont fini en avance d'expliquer aux autres permet d'utiliser efficacement le temps et les ressources humaines en classe.

- Les *travaux de groupes*, les *challenges* (par exemple, les étudiants doivent reproduire un graphique difficile), les *compétitions* (une course contre le temps et/ou entre plusieurs groupes pour résoudre un problème) participent efficacement à dynamiser le travail en classe et à varier les activités.

- L'utilisation des *réseaux sociaux* pour communiquer. Le forum de Moodle est peu ou pas utilisé du tout. Les issues de Github, une fois que les étudiants ont appris à les utiliser, s'avèrent utiles car elles sont disponibles près du dépôt lui-même qui contient les exercices. Mais ce qui fonctionne le mieux (testé en période de confinement Covid-19), c'est *Discord* parce que beaucoup d'étudiants connaissent et utilisent déjà pour les jeux. Le ton des échanges y est d'ailleurs plus décontracté (parfois nettement plus), mais cela reste un outil efficace pour aider un étudiant qui est bloqué dans sa progression.

- Les étudiants sollicitant une *aide plus directe* apprécient de pouvoir poser leurs questions par email. Afin de pouvoir être plus réactif, nous avons mis en place une adresse `sdd@sciviews.org` pour laquelle tous les enseignants du cours ont accès. Ainsi, les interventions peuvent être partagées et plus rapides.

- Pour obtenir un *retour plus direct* par rapport aux activités, nous mettons progressivement en place le **rapport de progression**. Les actions de l'étudiant dans les learnrs (et dans un second temps également H5P et les apps Shiny) sont enregistrées dans une base de données. Le rapport de progression est une app Shiny qui collecte, nettoies, prépare, et présente graphiquement la progression de l'étudiant. L'*émulation de groupe* est obtenue en comparant la progression de l'étudiant à la progression générale de la classe.

Afin d'avoir un retour immédiat, nous souhaitons rendre ce rapport de progression dynamique de sorte qu'il montre l'évolution en temps réel. Il est en effet important que l'étudiant puisse visualiser sur son rapport qu'il vient d'avancer en achevant à la seconde un exercice\ ! De plus, nous souhaitons associer cela à des récompenses sous forme de **badges** lorsque l'étudiant franchit une étape dans son apprentissage (aussi, des badges spéciaux pourraient être associés aux points bonus). La gestion des badges a été abordée dans la section dédiée à Moodle (voir \@ref(moodle)).

L'app Shiny de rapport de progression est développée dans le dépôt Github privé [sdd_progress-report](https://github.com/BioDataScience-Course/sdd_progress-report). Comme il contient du code sensible, il n'est pas disponible de manière publique. Par contre, les enseignants du cours y ont accès. Le fichier `README.md` du dépôt détaille son fonctionnement et contient du code pour le tester.

Cette app Shiny est ensuite intégrée dans Moodle via un lien URL qui ouvre l'app dans une fenêtre interne et lui passe des paramètres issus de Moodle (identité de l'étudiant, cours correspondant) afin de déterminer quel rapport il faut présenter.
