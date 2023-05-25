#' @export
add_tag <- function(text, tag = "li") {
  as.character(str_glue('<{tag}>{text}</{tag}>'))
}
