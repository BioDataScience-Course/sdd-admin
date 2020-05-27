# Bookdown {#bookdown}



...

**TODO: trouver un moyen simple de mettre à jour les pages statiques bookdown des cours dans Wordpress (ainsi que les données pour les rapports de progression des étudiants dans `/users`).**

Un essai a été fait en passant les informations via le query string de l'URL et en utilisant le plugin Wordpress **Variable shortcode**. Celà donne quelque chose comme ceci\ :

```
<a href="https://wp.sciviews.org/test-bookdown?login=[sv slug='sc-username']&amp;ghemail=[sv slug='sc-user-email']&amp;displayname=[sv slug='sc-display-name']&amp;firstname=[sv slug='sc-first-name']&amp;lastname=[sv slug='sc-last-name']">
```

Ensuite, c'est à bookdown d'enregistrer ces variables dans le **localStorage** du browser Web. Cela fonctionne, mais n'est pas optimal. Nous préférons au final que ce soit la page wordpress appelée par Moodle qui récupère ces informations et les stockent dans **localStorage**. Du coup, le plugin **Variable shortcode** n'est plus nécessaire. Voir la configuration de Wordpress pour en savoir plus (\@ref(wordpress)).
