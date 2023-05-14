recipes_sheet = "https://docs.google.com/spreadsheets/d/19CAAiLIdBZdaoN2sUOtj8maHS6Fuab13lsGDP7RMaBg/edit#gid=0"
recipe = googlesheets4::read_sheet(recipes_sheet, sheet = "recipe") %>% filter(!is.na(recipe_name))
step = googlesheets4::read_sheet(recipes_sheet, sheet = "step")
ingredient = googlesheets4::read_sheet(recipes_sheet, sheet = "ingredient")s

usethis::use_data(recipe, overwrite = TRUE)
usethis::use_data(step, overwrite = TRUE)
usethis::use_data(ingredient, overwrite = TRUE)

url <- function(text, link) {
  str_glue('<a href="{link}">{text}</a>')
}

starting_text = str_glue(sep=' ',
  'Weeknight dinner recipes should be easy and delicious. These recipes were',
  'curated from {url("Food Network", "https://www.foodnetwork.com/")}',
  '{url("NYTimes", "https://cooking.nytimes.com/")}',
  '{url("Better Homes and Gardens", "https://www.bhg.com/recipes/")}',
  'and elsewhere.',
  '<br>',
  'I made this app to make it easier for me to do my weekly grocery shopping',
  'and make a weekly dinner list. Too often, I have missed ingredients, or',
  'realized too late I have prepared for chicken three nights in a row.',
  'This app lets me curate a weekly menu quickly and easily, choosing from a',
  'selection of all of our favorite recipes.',
  '<br>',
  'I hope you find this tool easy to use and find some good recipes!'
)

usethis::use_data(starting_text, overwrite = TRUE)
