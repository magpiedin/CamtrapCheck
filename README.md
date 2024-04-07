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
- input: camtrap dataset metadata.json file -- e.g. [here](https://github.com/magpiedin/CamtrapCheck/blob/main/input_data/camtrap-dp-55a9f7ea-f07f-4e1c-84f5-32ef46604189/datapackage.json)
- output: summaries & visual-things

Run the `camtrapSandbox.R` script by entering this in the RStudio console: `source("camtrapSandbox.R")`

## [gridSandbox.R](https://github.com/magpiedin/CamtrapCheck/blob/main/gridSandbox.R)
- input: 3 CSVs in [input_data/tables](https://github.com/magpiedin/CamtrapCheck/tree/main/input_data/tables)
- output: 
  - plant/module chart/map (interactive and screenshot)
  - [plants_in_modules.csv](https://github.com/magpiedin/CamtrapCheck/tree/main/output_data)
  
Run the `gridSandbox.R` script by entering this in the RStudio console: `source("gridSandbox.R")`

## Resources / Sandboxes & possible next steps

### - [plants_in_modules.csv](https://github.com/magpiedin/CamtrapCheck/tree/main/output_data) 
- Consolidated table of which plants are/were where in the Wild Mile modules
- Currently generated with [input_data/tables](https://github.com/magpiedin/CamtrapCheck/tree/main/input_data/tables) & [gridSandbox.R](https://github.com/magpiedin/CamtrapCheck/blob/main/gridSandbox.R)
