FROM r-base:4.1.0
LABEL Name=rethinking Version=0.0.1

# Install OS dependencies
RUN apt-get update && \
    apt-get install -y libcurl4-gnutls-dev libxml2-dev libv8-dev libgmp3-dev pandoc pandoc-citeproc \
                       r-cran-tidyverse r-cran-rstan r-cran-coda r-cran-mvtnorm r-cran-loo \
                       r-cran-devtools r-cran-rmarkdown r-cran-knitr r-cran-shape && \
    rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e "install.packages(c('stargazer', 'dagitty'))" && \
    R -e "devtools::install_github('rmcelreath/rethinking')"

RUN mkdir /work
WORKDIR /work

CMD ["R"]
