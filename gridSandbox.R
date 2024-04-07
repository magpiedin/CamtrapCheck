# Merge tables of modules & plants data

library("readr")
library("ggplot2")
library("hrbrthemes")
library("plotly")

modules <- read_csv("input_data/tables/test.mods.csv")
plants <- read_csv("input_data/tables/test.plants.csv")
indiv_plants <- read_csv("input_data/tables/test.individualplants.csv", guess_max = 9000)

# Filter Module table-columns to simplify / start
module_columns_skip <- c("__v", "tags[0]", "tags[0]", "tags[1]", "tags[2]", "tags[3]",
                         "tags[4]", "tags[5]", "tags[6]", 
                         "createdAt", "updatedAt")

modules_basic <- modules[,!colnames(modules) %in% module_columns_skip]

colnames(modules_basic)[2:NCOL(modules_basic)] <- paste0("mod_", colnames(modules_basic)[2:NCOL(modules_basic)])

# Filter Plants columns
plants_columns_keep <- c("_id", "scientificName", "botanicPhoto", "common_name",
                         "family", "family_common_name", "image_url",
                         "thumbnail")

plants_basic <- plants[,colnames(plants) %in% plants_columns_keep]

colnames(indiv_plants)[which(grepl("^[xy]$", colnames(indiv_plants)) > 0)] <- 
  paste0("plant_", colnames(indiv_plants)[which(grepl("^[xy]$", colnames(indiv_plants)) > 0)])


# Merge Plant & Module tables to Indiv-Plants
indiv_plants_spp <- merge(indiv_plants[,-NCOL(indiv_plants)], # drop "__v" column
                          plants_basic,
                          by.x = "plant",
                          by.y = "_id",
                          all.x = TRUE)

indiv_plants_spp_mods <- merge(indiv_plants_spp, 
                               modules_basic,
                               by.x = "module",
                               by.y = "_id",
                               all.x = TRUE)

indiv_plants_spp_mods$mod_plant_x <- 
  as.numeric(paste0(indiv_plants_spp_mods$mod_x,
                    ".",
                    indiv_plants_spp_mods$plant_x))

indiv_plants_spp_mods$mod_plant_y <- 
  as.numeric(paste0(indiv_plants_spp_mods$mod_y,
                    ".",
                    indiv_plants_spp_mods$plant_y))


# Ouput consolidated table of plants, modules, & their coordinates
write_csv(indiv_plants_spp_mods,
          "output_data/plants_in_modules.csv", na = "")


# Prep & Output chart
# Example from https://r-graph-gallery.com/79-levelplot-with-ggplot2.html
indiv_plants_spp_mods$hover_text <- 
  paste0("family: ", indiv_plants_spp_mods$family, "\n",
         "scientific name: ", indiv_plants_spp_mods$scientificName, "\n",
         "common name: ", indiv_plants_spp_mods$common_name)

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
