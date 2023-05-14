# Split the recipes by ID
# Process into a continuous HTML

step_line <- function(step_description) {
  str_glue('<li>{step_description}</li>')
}

recipes_html = step %>%
  group_by(recipe_id) %>%
  arrange(step_num) %>%
  summarise(
    recipe_html = str_c(step_line(step_description), collapse='')
  )

usethis::use_data(recipes_html, overwrite=T)
