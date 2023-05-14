#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  ##############################################################################
  #### Sidebar Panel: Apply filters
  ##############################################################################
  recipe_filter = reactive({
    df = recipe
    if(!rlang::is_empty(input$selected_protein)) {
      df = df %>% filter(protein %in% input$selected_protein)
    }
    if(!rlang::is_empty(input$selected_carb)) {
      df = df %>% filter(carb %in% input$selected_carb)
    }
    return(df %>% pull(recipe_name))
  })

  observeEvent( recipe_filter(), {
      updateSelectInput(
        session, "selected_recipe",
        choices = recipe_filter()
      )
    },
    ignoreInit = TRUE, ignoreNULL = FALSE
  )

  ##############################################################################
  #### Main Panel: Body elements
  ##############################################################################
  recipe_chosen = reactive({
    recipe %>% filter(recipe_name == input$selected_recipe)
  })

  steps = reactive({
    step %>% semi_join(recipe_chosen(), by ="recipe_id") %>% arrange(step_num)
  })

  output$steps_html <- renderUI({
    steps() %>%
      pull(step_description) %>%
      lapply(tags$li)
  })
}
