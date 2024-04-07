# Merge tables of modules & plants data

library("readr")
library("ggplot2")
library("hrbrthemes")
library("plotly")
# App for interactive Humboldt Tree
library(shiny)
library(collapsibleTree)
# Define UI for application that draws a collapsible tree

ui <- fluidPage(
  
  titlePanel("Sandbox / Chart-o-Wild Mile plants & modules"),
  
  sidebarPanel(
    p("A hierarchical tree of ",
      a("FMNH RI data", href = "https://pj.fieldmuseum.org/event/1eba8f5e-c5f5-49fe-a373-773244234822"),
      "."),
    p("For more info, see", tags$b("sandox"),
      a("scripts", href = "https://github.com/magpiedin/CamtrapCheck/tree/main"),
      "and",
      a("data.", href = "https://github.com/magpiedin/CamtrapCheck/tree/main/input_data/tables"))
  ),
  
  # Show a tree diagram with the selected root node
  mainPanel(
    collapsibleTreeOutput("plot")
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
  
  # Configure a tree diagram
  output$plot <- renderCollapsibleTree({
    
    collapsibleTreeNetwork(
      hc_event,
      attribute = "siteCount",
      fill = "Color",
      nodeSize = "leafCount"
    )
  })
}

# Run the application
shinyApp(ui = ui, server = server)



p <- 
  ggplot(indiv_plants_spp_mods, 
         aes(mod_plant_x, 
             mod_plant_y, 
             fill = family,
             text = hover_text)) + 
  geom_tile() + 
  theme_ipsum()

# Set background to transparent
p <- p + theme(
  panel.background = element_rect(fill = "transparent",
                                  colour = NA_character_), # necessary to avoid drawing panel outline
  panel.grid.minor = element_blank(), # get rid of minor grid
  plot.background = element_rect(fill = "transparent",
                                 colour = NA_character_) # necessary to avoid drawing plot outline
  # Un-comment lines below (& check for missing or extra commas above/below)
  # panel.grid.major = element_blank(), # get rid of major grid
  # legend.background = element_rect(fill = "transparent"),
  # legend.box.background = element_rect(fill = "transparent"),
  # legend.key = element_rect(fill = "transparent")
)


ggplotly(p, tooltip="text")

# Export a transparent PNG of the chart
ggsave(
  plot = p,
  filename = "transparent_chart.png",
  bg = "transparent"
)


# TO DO 
# -- Tying in / overlaying camtrap data?
# -- e.g. maybe a way to display plant or other images on hover?
# https://stackoverflow.com/questions/73280006/tooltip-inserting-image-and-or-ggplot-in-plotly-r
