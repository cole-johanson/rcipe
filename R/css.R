rcipe_palette <- c(
  "text" = "#F7F6F0",
  "bg" = "#28333c",
  "sidebar" = "#9b2437"

  #f0d5b9,d0b297,f7f6f0,6a4931,b89e87
)

#' fluidPage head style
#'
#' Used in the app's ui tags$head(tags$style())
#'
#' @export
fluid_page_head_style <- function() {
  str_c('
    #sidebar {
      background-color: ',rcipe_palette['sidebar'],';
      color: white;
      border: 1px solid white;
    }
    .nav-tabs>li>a {
      color: ',rcipe_palette['bg'],'; font-weight: bold;
    }
    .tabbable>.nav>li[class=active]>a {
      color: ',rcipe_palette['sidebar'],'; font-weight: bold;
    }
    body, label, input, button, select {
      font-family: "Aileron",Helvetica,Arial,sans-serif;
    }
    summary {
      display: revert
    }
    a, a:focus, a:hover, a:focus, a:active {
      color: white; font-weight: bold;
    }
    a:visited {
      color: ',rcipe_palette['text'],';
    }
  ')
}

#' fluidPage style
#'
#' Used in the app's ui tags$style()
#'
#' @export
fluid_page_style <- function() {
  str_c('
    #fullpage { background-color: ', rcipe_palette['bg'],'; }
    .webpro_navbar {
      background-color: ', rcipe_palette['sidebar'],'; }
    }
  ')
}

header_bar_html <- function(text, background_color= rcipe_palette['sidebar'], text_color=rcipe_palette['text']) {
  HTML(str_glue('
    <nav class="navbar navbar-light" style="background-color:{background_color}">
      <span class="navbar-brand mb-0 h1" style="color:{text_color}; font-size: 60px;"><b>{text}</b></span>
    </nav>
  '))
}

title_html  <- function(text, text_color=rcipe_palette['text']) {
  HTML(str_glue('
    <h4 style="color:{text_color}"><b>{text}</b></h4>
  '))
}
