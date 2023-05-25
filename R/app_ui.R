#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    shinyjs::useShinyjs(),
    golem_add_external_resources(),
    fluidPage(
      id="fullpage",
      shinyWidgets::setBackgroundColor(rcipe_palette['bg']),
      tags$head(tags$style(
        HTML(fluid_page_head_style())
      )),
      tags$style(fluid_page_style()),
      # Content
      #header_bar_html("NavigatR"),
      htmltools::h3(
        'Weeknight Recipes',
        style = str_glue('text-align: center; color:{rcipe_palette["text"]}; font-weight: 900')
      ),
      sidebarLayout(
        sidebarPanel(
          id="sidebar",
          selectInput(
            "selected_protein", 'Protein', choices=unique(recipe$protein), selectize=T, multiple=T
          ),
          selectInput(
            'selected_carb', 'Carbohydrate', choices = unique(recipe$carb), selectize=T, multiple=T
          ),
          selectizeInput(
            'selected_recipe', 'Recipe', unique(recipe$recipe_name),
            options = list(
              placeholder = 'Recipe...',
              onInitialize = I('function() { this.setValue(""); }')
            )
          )
          # Add to grocery list button (only appears if one recipe is chosen)
          # Refresh grocery list
        ),
        mainPanel(
          #fluidRow(uiOutput('recipe_title'),align="center"),
          tags$ol(
            uiOutput('steps_html')
          )
        )
      ),
      # Area below sidebar layout: Two items: grocery list and pantry list
      # splitLayout(groceries, pantry)
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "rcipe"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
