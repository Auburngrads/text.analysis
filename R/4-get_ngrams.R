#' Create data.frame of n-grams
#'
#' @param x A character string of text
#' @param n Number of n-grams to get
#' @param ... Additional arguments for \code{tau::textcnt}
#'
#' @importFrom tau textcnt
#'
#' @export

get_ngrams <- function(x, n,...) {

  df <- data.frame(count = unclass(tau::textcnt(x, method = "string", n = n,...)))

  df$text <- rownames(df)

  rownames(df) <- NULL

  return(df[order(df[,1], decreasing = T),])

}

