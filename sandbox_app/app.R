# Merge tables of modules & plants data

library("readr")
library("ggplot2")
library("hrbrthemes")
library("plotly")
library("shiny")

# Define UI for app
ui <- fluidPage(
  
  titlePanel("Sandbox / Chart-o-Wild Mile plants & modules"),
  
  sidebarPanel(
    p("A draft-chart of plant families & locations in the",
    a("Urban Rivers", href = "https://www.urbanriv.org/"), 
      "Wild Mile floating gardens."),
    p("For more info, see", 
      a(tags$b("sandox app"), href = "https://github.com/magpiedin/CamtrapCheck/tree/main/sandbox_app"),
      "and associated",
      a("scripts", href = "https://github.com/magpiedin/CamtrapCheck/tree/main"),
      "and",
      a("data.", href = "https://github.com/magpiedin/CamtrapCheck/tree/main/input_data/tables"))
  ),
  
  # Show a tree diagram with the selected root node
  mainPanel(
    plotlyOutput("plot")
  )
)

# Define server logic required to draw a collapsible tree diagram
server <- function(input, output) {
  
  # Import consolidated table
  indiv_plants_spp_mods <- read_csv("plants_in_modules.csv")
  
  # Prep & Output chart
  indiv_plants_spp_mods$hover_text <- 
    paste0("family: ", indiv_plants_spp_mods$family, "\n",
           "scientific name: ", indiv_plants_spp_mods$scientificName, "\n",
           "common name: ", indiv_plants_spp_mods$common_name)

    output$plot <- renderPlotly({
      
      p <- 
        ggplot(indiv_plants_spp_mods, 
               aes(mod_plant_x, 
                   mod_plant_y, 
                   fill = family,
                   text = hover_text)) + 
        geom_tile() + 
        theme_ipsum() + 
        theme(
          panel.background = element_rect(fill = "transparent",
                                          colour = NA_character_),
          panel.grid.minor = element_blank(),
          plot.background = element_rect(fill = "transparent",
                                         colour = NA_character_)
          # Un-comment lines below (& check for missing or extra commas above/below)
          # panel.grid.major = element_blank(), # get rid of major grid
          )
      
      ggplotly(p, tooltip="text")
      
    })
}

# Run the application
shinyApp(ui = ui, server = server)
