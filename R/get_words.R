#' Get all words from a document
#'
#' @param doc A character string extracted from a document
#'
#' @importFrom stringi stri_extract_all_words
#' @importFrom tidytext stop_words
#'
#' @export
get_words <- function(doc) {

  uni <- data.frame(pre = '<p>',
                    unigrams = unlist(stri_extract_all_words(doc)),
                    post = '</p>',
                    stringsAsFactors = F)

  uni$is_stop = sapply(X = 1:nrow(uni),
                       FUN = function(x) {

                         as.logical(grepl(uni$unigrams[x],
                                          tidytext::stop_words[,1]))
                         })

  uni$is_numeric <- !is.na(suppressWarnings(as.numeric(uni$unigrams)))

  return(uni)

}

