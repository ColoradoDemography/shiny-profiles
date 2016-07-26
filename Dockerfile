FROM rocker/shiny:latest

MAINTAINER Rob Kemp "robert.kemp@state.co.us"

RUN apt-get update && apt-get install -y libssl-dev git && \
    R -e "install.packages(c('devtools', 'shiny', 'rmarkdown', 'tm', 'wordcloud', 'memoise', 'dplyr', 'plotly', 'tidyr', 'scales'), repos='http://cran.rstudio.com/')" && \
    R -e "devtools::install_github("ropensci/plotly")" && \
    cd /srv/shiny-server && \
    git clone https://github.com/ColoradoDemography/demographic_dashboard && \
    git clone https://github.com/ColoradoDemography/netmigration_dashboard && \
    git clone https://github.com/robkemp/estimates_review_dashboard
    
