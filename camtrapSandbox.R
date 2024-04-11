# Quick demo of what Camera Crew could do with camtrap-dp datasets

install.packages("devtools")
devtools::install_github("inbo/camtraptor")

library(camtraptor)

# Import sample Urban Rivers dataset
ur_camtrap_data <- read_camtrap_dp("input_data/camtrap-dp-55a9f7ea-f07f-4e1c-84f5-32ef46604189/datapackage.json",
                                   media = F)

# Map observations in a camtrap dataset
map_ur_camtrap_data <- map_dep(ur_camtrap_data, feature = "rai", species = "Branta canadensis")
map_ur_camtrap_data

# Generate various summary stats
get_cam_op(ur_camtrap_data)
get_n_species(ur_camtrap_data)


# # Alternative example-dataset
# tdwg_demo_data <- read_camtrap_dp("https://raw.githubusercontent.com/tdwg/camtrap-dp/1.0/example/datapackage.json")
# map_tdwg_demo_data <- map_dep(tdwg_demo_data, feature = "rai", species = "Vulpes vulpes")
# map_tdwg_demo_data

# # Generate summary stats
# calc_animal_pos(tdwg_demo_data)

# # Output Darwin Core + Audiovisual Core dataset for publishing
# # NOTE - errors currently
# write_dwc(ur_camtrap_data)
