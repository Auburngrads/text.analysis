.onLoad <- function(libname, pkgname){

  # install these from github, not CRAN:
pkglist <- list(
    c(name = 'termco', url = "trinker/termco"),
    c(name = 'coreNLPsetup', url = "trinker/coreNLPsetup"),
    c(name = "tagger", url = "trinker/tagger"),
    c(name = "textshape", url = "trinker/textshape"))


for(pkg in pkglist)
    if(!suppressWarnings(suppressPackageStartupMessages(require(pkg['name'],
        quietly=TRUE,character.only=TRUE)))){
        devtools::install_github(pkg['url'])
        suppressPackageStartupMessages( library(pkg['name'],character.only=TRUE))
    }

}
