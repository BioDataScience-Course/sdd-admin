# Bookdown & learndown {#bookdown}



...

**TODO: trouver un moyen simple de mettre à jour les pages statiques bookdown des cours dans Wordpress (ainsi que les données pour les rapports de progression des étudiants dans `/users`).**

## Intégration dans Wordpress

Pour l'instant, il y a deux versions\ :

- Les pages affichées telles quelles. Nous avons une présentation bookdown classique. Les informations de l'identité de l'étudiant sont transmise via `localStorage`, mais le bandeau supérieur du site et la barre noire supérieure de gestion Wordpress ne sont pas affichés. Le bookdonw n'est pas vraiment intégré dans le site. Cette représentation est utile pour l"utilisation du bookdown dans un contexte hors cours UMONS.

- Les même page du bookdown, **mais intégrées sous forme d'iframe** dans une page de Wordpress dédiée. Nous utilisons le plugin *Advanced iFrame Pro* qui permet de contrôler la taille de l'iframe, de lui passer des paramètres et encore d'autres choses. Cela donne pas mal, et l'utilisateur conserve la barre d'outils supérieure (accès à Moodle, Discord, etc.) ainsi que la barre noire supérieure de contrôle Wordpress qui permet aussi de vérifier d'un coup d'œil que l'on est connecté, et sous quelle identité nous le sommes. S'il veut lire le contenu du bookdown sans voir la bannière haute, le lecteur peut faire coulisser la page jusque tout en bas et cette bannière viendra se cacher derrière la barre noire supérieure Wordpress (qui, elle, reste toujours visible tant que l'utilisateur est connecté au site).

## Contenu H5P dans bookdown

Nous avons déjà vu que le contenu H5P s'affiche dans un iframe dans un document principal. Il lui transmet les événements xAPI, et c'est donc ce document principal qui doit les traiter. Nous avons ici une impossibilité à le faire si nous sommes dans un cas où H5P est servi par un serveur différent que notre bookdown. En effet, les accès en "Cross-Origin Resource Sharing" ou CORS sont restreintes pour éviter des attaques de site évidentes. Ainsi un iframe issu d'un serveur différent de la page qui l'héberge ne peut communiquer librement avec la page qui le contient si elle provient d'un site différent. Or, nous avons besoin de cette communication pour transmettre les événements xAPI...

La solution que nous avons trouvée est d'ajouter le dossier qui contient nos pages statiques du bookdown à Wordpress directement. Ainsi les deux sont maintenant servis à partir de la même adresse https://wp.sciviews.org. Pour l'instant, nous copions simplement ces fichiers dans un sous-dossier `sdd-umons` dans `lamp0/web/vhosts/wp.sciviews.org/htdocs`. Ainsi, le bookdown en question est servi par Wordpress à l'adresse https://wp.sciviews.org/sdd-umons. Et à présent, la communication des xAPI H5P est possible... à condition d'ajouter le code nécessaire dans bookdown, mais cela, nous l'avons expliqué dans le chapitre consacré à H5P (\@ref(h5p)).

Il nous faut maintenant inclure facilement les contenus H5P depuis Wordpress dans nos pages bookdown. Ces contenus sont identifiés par un numéro (ID) dans Wordpress. Cet ID apparaît clairement dans la liste des contenus H5P dans le tableau de bord. Il suffit de noter le numéro ID correspondant au contenu que l'on souhaite inclure.

![H5P Content dans Wordpress. Les widgets sont identifiés par leur **ID** (ici, 6, 7, 8, 9 & 10).](images/wordpress/h5p-content.png)

Nous devons créer un iframe dans la page bookdown, mais nous pouvons déléguer ce travail à une fonction R. Cette fonction est incluse dans le package `learndown` dans une forme plus complète, mais pour comprendre ce qu'elle fait, nous pouvons nous concentrer sur la version simplifiée ci-dessous\ :


```r
h5p <- function(id, width = 780, height = 500) {
  glue::glue("\n<iframe src=\"https://wp.sciviews.org/wp-admin/admin-ajax.php?action=h5p_embed&id={id}\" width=\"{width}\" height=\"{height}\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" class=\"h5p\"></iframe><script src=\"https://wp.sciviews.org/wp-content/plugins/h5p/h5p-php-library/js/h5p-resizer.js\" charset=\"UTF-8\"></script>\n")
}
```

La fonction construit un fragment HTML qui ajoute un iframe et un script pour gérer l'inclusion du contenu H5P dans notre bookdown. A partir d'ici, ajouter un contenu H5P est aussi simple que d'ajouter `h5p(id)` dans du code R en ligne où "id" est l'ID que nous avons noté. On peut aussi jouer sur les arguments `width=` et `height=` pour ajuster l'emplacement et la taille du contenu H5P dans la page.

Ainsi programmé notre contenu H5P se comporte comme suit\ :

- pour un utilisateur enregistré dans Wordpress, les événements xAPI sont enregistrés à son nom. Nous pouvons donc suivre la progression de nos étudiants via les contenus H5P parsemés dans le bookdown également, en plus des applis Shiny et des learnrs. De plus, l'état d'achèvement de l'exercice est aussi enregistré pour un bon nombre de contenus H5P et rétabli lorsque la page est rechargée par le même utilisateur.

- pour un utilisateur non enregistré, les contenus H5P fonctionnent normalement, mais aucun événement xAPI n'est enregistré, et l'état de complétude de l'exercice n'est pas conservé non plus. Si la page est rechargée, les contenus H5P retournent à leur état initial à chaque fois.

Ceci est un inconfort mineur pour un utilisateur anonyme et permet l'utilisation des contenus H5P de manière optimale pour nos étudiants dûment enregistrés, tout en permettant une libre utilisation par d'autres visiteurs sans polluer notre base de données.

Nous avons également tenté de passer des arguments supplémentaires via l'URL qui lance la page bookdown, et qui les tranfèrent vers l'iframe H5P, mais sans succès car apparemment Worpress réécrit l'URL et laisse tomber ces arguments supplémentaires. Mais de toutes façons, ce n'est pas important pour l'instant car nous pouvons tracer nos utilisateurs enregistrés dans Wordpress telle que c'est actuellement implémenté.
