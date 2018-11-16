FROM rocker/shiny:latest

MAINTAINER Todd Bleess "todd.bleess@state.co.us"

RUN apt-get update && apt-get install -y libssl-dev git && \
    R -e "install.packages('curl')" && \
    R -e "install.packages(c('devtools', 'shiny', 'rmarkdown', 'tm', 'wordcloud', 'memoise', 'dplyr', 'tidyr', 'scales', 'plotly', 'readxl', 'readr', 'car', 'shinydashboard', 'rgdal', 'raster', 'tidycensus', 'tmap', 'tmaptools', 'stringr', 'tidyverse'))"

EXPOSE 8080
