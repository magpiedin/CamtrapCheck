# CamtrapCheck
Scripts to check a dataset in camtrap-dp format

## Setup
1. Install R & [RStudio](https://posit.co/download/rstudio-desktop/)
2. Clone or Download this repo
3. Open the 'Rproj' file in RStudio
4. Install required packages (e.g. [`camtraptor`](https://github.com/inbo/camtraptor/)) by running this in the RStudio console (lower-left panel):
```
install.packages(c("camtraptor", "ggplot2", "hrbrthemes", "plotly", "readr"))
```

## [camtrapSandbox.R](https://github.com/magpiedin/CamtrapCheck/blob/main/camtrapSandbox.R)
- input: [camtrap-dp](https://camtrap-dp.tdwg.org) dataset datapackage.json file -- e.g. [here](https://github.com/magpiedin/CamtrapCheck/blob/main/input_data/camtrap-dp-55a9f7ea-f07f-4e1c-84f5-32ef46604189/datapackage.json)
- output: summaries & visual-things

Run the `camtrapSandbox.R` script by entering this in the RStudio console: `source("camtrapSandbox.R")`

## [gridSandbox.R](https://github.com/magpiedin/CamtrapCheck/blob/main/gridSandbox.R)
- input: 3 CSVs in [input_data/tables](https://github.com/magpiedin/CamtrapCheck/tree/main/input_data/tables)
- output: 
  - map/chart of plants in Wild Mile modules (interactive and screenshot)
  - [plants_in_modules.csv](https://github.com/magpiedin/CamtrapCheck/tree/main/output_data) -- consolidated table of which plants are/were where in the Wild Mile modules
  
Run the `gridSandbox.R` script by entering this in the RStudio console: `source("gridSandbox.R")`

## Next steps
- Which Camera Trap or other Wild Mile data would it help to tie together?
- How / Where / For whom?

### Resources:
- [Camera Crew workflows & docs](https://drive.google.com/drive/u/1/folders/172Kd0gDSpqvSuUFRm-RDMCabYptwfP7T)
- [Camtrap-DP data format](https://camtrap-dp.tdwg.org)
- [Urban Rivers](https://www.urbanriv.org/)

### To do: 

**In sdUploader** / [camtrapPackager.py](https://github.com/nkwsy/sdUploader/blob/wildlife_cam/camtrapPackager.py):
1. Need to add camtrap-dp ['sources'](https://camtrap-dp.tdwg.org/metadata/#sources) to datapackage.json
2. Post-observations re-form camtrap-dp to parse out taxa
3. address sequenceID? (is that column empty)


