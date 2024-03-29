% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/6-merge_texts.R
\name{merge_text}
\alias{merge_text}
\title{Merge text files}
\usage{
merge_text(reports = T, nouns = NULL)
}
\arguments{
\item{reports}{A \code{logical} value. If \code{TRUE},
pulls files from the sab_reports
directory.  Otherwise, the files
are pulled from the sab_reviews
directory.}
}
\description{
This function takes code from one
             of two directories and merges them
             by their sub directories. In this case
             the subdirectories are each year.
}
