FROM r-base:4.1.0
LABEL Name=rethinking Version=0.0.1

# Install OS dependencies
RUN apt-get update && \
    apt-get install -y libcurl4-gnutls-dev libxml2-dev libv8-dev libgmp3-dev pandoc pandoc-citeproc && \
    rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e "install.packages(c('devtools', 'rmarkdown', 'knitr', 'stargazer', 'tidyverse', 'shape', 'renv'))" && \
    R -e "devtools::install_github('stan-dev/cmdstanr')" && \
    R -e "cmdstanr::install_cmdstan()" && \
    R -e "install.packages(c('coda', 'mvtnorm', 'loo', 'dagitty'))" && \
    R -e "devtools::install_github('rmcelreath/rethinking')"

RUN mkdir /work
WORKDIR /work

CMD ["R"]
