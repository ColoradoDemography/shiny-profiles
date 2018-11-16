FROM rocker/shiny:latest

MAINTAINER Todd Bleess "todd.bleess@state.co.us"

RUN apt-get update && apt-get install -y libssl-dev && apt-get install -y libpq-dev && apt-get install -y libxml2-dev git && apt-get update && apt-get install libgdal-dev libproj-dev

RUN R -e "install.packages(c('curl', 'devtools', 'shiny', 'rmarkdown', 'tm', 'wordcloud', 'memoise', 'dplyr', 'tidyr', 'scales', 'plotly', 'readxl', 'readr', 'car', 'shinydashboard', 'rgdal', 'raster', 'tidycensus', 'tmap', 'tmaptools', 'stringr', 'tidyverse'))"
    
RUN R -e "devtools::install_github('ColoradoDemography/ProfileDashboard')" && \
    R -e "devtools::install_github('ColoradoDemography/codemogAPI')" && \
    R -e "devtools::install_github('ColoradoDemography/codemogProfile')" && \
    R -e "devtools::install_github('ColoradoDemography/codemogLib')"
