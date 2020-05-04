if (!require("renv")) install.packages("renv")
renv::activate()

renv::install(c("tidyverse", "stargazer"))

renv::install(c("coda","mvtnorm","devtools","loo","dagitty"))
renv::install("rmcelreath/rethinking")

renv::snapshot()
