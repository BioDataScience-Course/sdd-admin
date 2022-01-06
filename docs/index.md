--- 
title: "Plateforme pédagogique BioDataScience"
author: "Philippe Grosjean & Guyliann Engels"
date: "2022-01-06"
site: bookdown::bookdown_site
output:
  bookdown::gitbook:
    info: yes
    includes:
      in_header: header.html
      after_body: footer.html
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
github-repo: BioDataScience-Course/sdd-admin
url: 'http\://phgrosjean.sciviews.org/bookdown-test/'
description: "Administration de BioDataScience-Course."
cover-image: "images/front-cover.png"
---

# Préambule {-}



Cet ouvrage détaille le développement, la maintenance et la création de contenu sur notre plateforme autour du package R {learnitdown} que nous avons créé à l'Université de Mons en Belgique pour nos outils pédagogiques relatifs à nos cours de Science des Données Biologiques. Ce sont, avant tout, des notes pour nous-mêmes. Désolé, donc, si vous y lirez de temps en temps des informations qui ne sont utiles **que** dans le cadre spécifiquement de nos cours. Notre objectif est quand même de faire migrer progressivement cet ouvrage vers un usage plus large pour permettre de déployer une plateforme pédagogique similaire dans un autre contexte...


![](images/front-cover.png)

_Le matériel dans cet ouvrage est distribué sous licence [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.fr)._

<details>
<summary>Détails concernant le système utilisé pour compiler ce bookdown...</summary>

##### Information système {-}


```r
sessioninfo::session_info()
```

```
# ─ Session info ───────────────────────────────────────────────────────────────
#  setting  value                                      
#  version  R version 4.0.5 Patched (2021-03-31 r80240)
#  os       macOS Big Sur 10.16                        
#  system   x86_64, darwin17.0                         
#  ui       X11                                        
#  language (EN)                                       
#  collate  en_US.UTF-8                                
#  ctype    en_US.UTF-8                                
#  tz       Europe/Brussels                            
#  date     2022-01-06                                 
# 
# ─ Packages ───────────────────────────────────────────────────────────────────
#  package     * version date       lib source                            
#  bookdown      0.22    2021-04-22 [1] CRAN (R 4.0.2)                    
#  bslib         0.2.5   2021-05-12 [1] CRAN (R 4.0.5)                    
#  cli           2.5.0   2021-04-26 [1] CRAN (R 4.0.2)                    
#  digest        0.6.27  2020-10-24 [1] CRAN (R 4.0.2)                    
#  evaluate      0.14    2019-05-28 [1] CRAN (R 4.0.0)                    
#  htmltools     0.5.1.1 2021-01-22 [1] CRAN (R 4.0.2)                    
#  jquerylib     0.1.4   2021-04-26 [1] CRAN (R 4.0.2)                    
#  jsonlite      1.7.2   2020-12-09 [1] CRAN (R 4.0.2)                    
#  knitr         1.33    2021-04-24 [1] CRAN (R 4.0.2)                    
#  magrittr      2.0.1   2020-11-17 [1] CRAN (R 4.0.2)                    
#  R6            2.5.0   2020-10-28 [1] CRAN (R 4.0.2)                    
#  rlang         0.4.11  2021-04-30 [1] CRAN (R 4.0.2)                    
#  rmarkdown     2.11.3  2021-11-20 [1] Github (Rstudio/rmarkdown@69e6f98)
#  sass          0.4.0   2021-05-12 [1] CRAN (R 4.0.2)                    
#  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 4.0.2)                    
#  stringi       1.6.1   2021-05-10 [1] CRAN (R 4.0.2)                    
#  stringr       1.4.0   2019-02-10 [1] CRAN (R 4.0.2)                    
#  withr         2.4.2   2021-04-18 [1] CRAN (R 4.0.2)                    
#  xfun          0.23    2021-05-15 [1] CRAN (R 4.0.2)                    
#  yaml          2.2.1   2020-02-01 [1] CRAN (R 4.0.0)                    
# 
# [1] /Library/Frameworks/R.framework/Versions/4.0/Resources/library
```

</details>
