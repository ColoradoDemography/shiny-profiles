FROM rocker/shiny:latest

MAINTAINER Todd Bleess "todd.bleess@state.co.us"

RUN apt-get update && apt-get install -y libssl-dev git && apt-get install -y libpq-dev git && apt-get install -y libxml2-dev git && apt-get update && apt-get install libgdal-dev libproj-dev &&\
    R -e "install.packages('curl')" && \
    R -e "install.packages(c('devtools', 'shiny', 'rmarkdown', 'tm', 'wordcloud', 'memoise', 'dplyr', 'tidyr', 'scales', 'plotly', 'readxl', 'readr', 'car', 'shinydashboard', 'rgdal', 'raster', 'tidycensus', 'tmap', 'tmaptools', 'stringr', 'tidyverse', 'knitr', 'kableExtra', 'RPostgeSQL', 'shinyjs', 'VennDiagram', 'geojsonio', 'gridExtra', 'ggthemes', 'maptools'))" && \
    R -e "devtools::install_github('ColoradoDemography/ProfileDashboard')" && \
    R -e "devtools::install_github('ColoradoDemography/codemogAPI')" && \
    R -e "devtools::install_github('ColoradoDemography/codemogLib')" && \
    R -e "devtools::install_github('ColoradoDemography/codemogProfile')" && \
    cd /srv/shiny-server && \
    git clone https://github.com/ColoradoDemography/demographic_dashboard && \
    git clone https://github.com/ColoradoDemography/netmigration_dashboard && \
    git clone https://github.com/ColoradoDemography/ProfileDashboard2 && \
    git clone https://github.com/ColoradoDemography/MapCreate
