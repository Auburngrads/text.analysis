#' Creates an object to store text analyses
#' data.frame of n-grams words from a document
#'
#' @param input_dir A directory from which input files will be taken
#' @param output_dir A directory to which output files will be written
#'
#' @import rprojroot devtools
#' @importFrom qdap mgsub
#'
#' @export
extract_content <- function(input_dir, output_dir) {

this_dir <- list.files(input_dir, recursive = F, full.names = T)

for(j in this_dir) {

files <- dir(j, recursive = T, full.names = T)

for(i in files) {

  text <- get_text(i)

  speech <- get_speech(text)

  xterms <- sapply(X = 10:1,
                   FUN = function(x) paste0(rep('xx', x), collapse = ''))

  text2 <- qdap::mgsub(xterms, '', text)

  ngrams <- lapply(X = 1:10,
                   FUN = function(x) get_ngrams(text2, n = x))

  topics <- get_speech_text(speech, nouns = T)
  action <- get_speech_text(speech, nouns = F)

  filename <- get_filename(i)

  assign(filename, list(text = text2,
                        speech = speech,
                        ngrams = ngrams,
                        filename = filename,
                        topics = topics,
                        actions = action))

  save_dir <- output_dir
  save_file <- paste0(filename,'.RData')

  if(!dir.exists(save_dir)) dir.create(save_dir)

  save(list = get(filename)$filename,
       file = file.path(save_dir,save_file))
}
}
}
