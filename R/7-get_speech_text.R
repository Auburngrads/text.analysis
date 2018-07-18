#' Get objects or actions from a document
#'
#' @param obj A \code{data.frame} containing parts of speech tagging
#' @param nouns A \code{logical} determining if topics or actions are desired
#'
#' @export

get_speech_text <- function(obj, nouns = TRUE) {

  if(!is.data.frame(obj)) obj <- obj[['speech']]

  if(nouns){

    text <- obj[tolower(substr(obj[['pos']],1,1)) == 'n','token'][[1]]

  } else {

    text <- obj[tolower(substr(obj[['pos']],1,1)) == 'v','token'][[1]]

  }

  lines <- paste(c(text[nchar(text) > 0]), collapse = ' ')


  return(lines)

}
