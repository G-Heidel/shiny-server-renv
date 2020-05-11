FROM rocker/shiny:3.6.0

RUN Rscript -e 'install.packages(c("renv"),  dependencies = TRUE, repos="http://cran.rstudio.com/")'

ADD app /srv/shiny-server/app

WORKDIR /srv/shiny-server/app

RUN Rscript -e 'setwd("/srv/shiny-server/app"); source(".Rprofile"); renv::restore()'

EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"]