# Quick demo of what we can do with camtrap-dp datasets

library(camtraptor)

test3 <- read_camtrap_dp("https://raw.githubusercontent.com/tdwg/camtrap-dp/1.0/example/datapackage.json")

test4 <- read_camtrap_dp("input_data/camtrap-dp-55a9f7ea-f07f-4e1c-84f5-32ef46604189/datapackage.json",
                         media = F)
# TO DO - back in camtrapPackager.py:
#   1. Need to add 'sources' (sdUploader) _
#   2. Post-observations re-form camtrap-dp to parse out taxa
#   3. address sequenceID? (is that col empty)

# test5 <- read_camtrap_dp("input_data/camtrap-dp-8d15d5c1-3136-4ee8-a960-11a29d1972a4.zip", 
#                          media=F)

map_data_test <- map_dep(test3, feature = "rai", species = "Vulpes vulpes")

map_data_test4 <- map_dep(test4, feature = "rai", species = "Branta canadensis")

map_data_test
map_data_test4

get_cam_op(test4)
get_n_species(test4)
calc_animal_pos(test3)

write_dwc(test4)
