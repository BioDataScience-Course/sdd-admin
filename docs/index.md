--- 
title: "A Test Bookdown Book"
author: "Philippe Grosjean & Guyliann Engels"
date: "2020-05-20"
site: bookdown::bookdown_site
output:
  bookdown::gitbook:
    info: yes
    includes:
      in_header: h5p.html
      after_body: disqus.html
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
github-repo: phgrosjean/bookdown-test
url: 'http\://phgrosjean.sciviews.org/bookdown-test/'
description: "Tutoriel interactif pour la science des données avec R & SciViews-R."
cover-image: "images/front-cover.png"
---

# Préambule {-}



Contenu de cet ouvrage en bref...

![](images/front-cover.png)

----

_Le matériel dans cet ouvrage est distribué sous licence [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.fr)._

----

##### System information {-}


```r
sessioninfo::session_info()
```

```
# ─ Session info ───────────────────────────────────────────────────────────────
#  setting  value                       
#  version  R version 3.6.3 (2020-02-29)
#  os       macOS Catalina 10.15.4      
#  system   x86_64, darwin15.6.0        
#  ui       X11                         
#  language (EN)                        
#  collate  en_US.UTF-8                 
#  ctype    en_US.UTF-8                 
#  tz       Europe/Brussels             
#  date     2020-05-20                  
# 
# ─ Packages ───────────────────────────────────────────────────────────────────
#  package     * version    date       lib source                            
#  assertthat    0.2.1      2019-03-21 [1] CRAN (R 3.6.0)                    
#  bookdown      0.18       2020-03-05 [1] CRAN (R 3.6.0)                    
#  cli           2.0.2      2020-02-28 [1] CRAN (R 3.6.0)                    
#  crayon        1.3.4.9000 2020-04-29 [1] Github (r-lib/crayon@dcf6d44)     
#  digest        0.6.25     2020-02-23 [1] CRAN (R 3.6.0)                    
#  evaluate      0.14       2019-05-28 [1] CRAN (R 3.6.0)                    
#  fansi         0.4.1      2020-01-08 [1] CRAN (R 3.6.0)                    
#  glue          1.4.0      2020-04-03 [1] CRAN (R 3.6.2)                    
#  htmltools     0.4.0.9003 2020-04-29 [1] Github (rstudio/htmltools@984b39c)
#  knitr         1.28       2020-02-06 [1] CRAN (R 3.6.0)                    
#  magrittr      1.5        2014-11-22 [1] CRAN (R 3.6.0)                    
#  rlang         0.4.5      2020-03-01 [1] CRAN (R 3.6.0)                    
#  rmarkdown     2.1        2020-01-20 [1] CRAN (R 3.6.0)                    
#  sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 3.6.0)                    
#  stringi       1.4.6      2020-02-17 [1] CRAN (R 3.6.0)                    
#  stringr       1.4.0      2019-02-10 [1] CRAN (R 3.6.0)                    
#  withr         2.2.0      2020-04-20 [1] CRAN (R 3.6.2)                    
#  xfun          0.13       2020-04-13 [1] CRAN (R 3.6.2)                    
#  yaml          2.2.1      2020-02-01 [1] CRAN (R 3.6.0)                    
# 
# [1] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
```
