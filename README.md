# CamtrapCheck
Scripts to check a dataset in camtrap-dp format

## Setup
### Option a (online):
1. Setup a login for posit.cloud -- free option here: https://posit.cloud/plans/free
2. Make your own cloud-copy of this repo by clicking here: https://posit.cloud/content/7957756
    - See [user guide](https://docs.posit.co/ide/user/ide/guide/ui/ui-panes.html) for RStudio (similar/same interface as "posit Cloud") for general help
    - See below for [how to run scripts](https://github.com/magpiedin/CamtrapCheck/main/README.md#how-to-run-scripts) from this repo

### Option b (on your machine):
1. Install [R](https://cloud.r-project.org/) & [RStudio](https://posit.co/download/rstudio-desktop/)
2. Clone this repo -- Or download it by clicking the green **Code** button, choosing **Download ZIP** at the end of the drop-down menu, and unzipping the CamtrapCheck-main.zip file.
3. Open the R-project in RStudio. (Go to File --> Open project... --> select the "CamtrapCheck.Rproj" file from the unzipped CamtrapCheck-main folder.)
4. Install required packages by entering this in the RStudio Console ([lower-left panel](https://docs.posit.co/ide/user/ide/guide/ui/ui-panes.html)):
```
install.packages(c("ggplot2", "hrbrthemes", "plotly", "readr"))
```

The [`camtraptor`](https://github.com/inbo/camtraptor/) package is not currently available on CRAN, but it can be installed with `devtools::install()` as shown below:
```
install.packages("devtools")
devtools::install_github("inbo/camtraptor")
```

## How to run scripts:

### [camtrapSandbox.R](https://github.com/magpiedin/CamtrapCheck/blob/main/camtrapSandbox.R)
- **input:** [camtrap-dp](https://camtrap-dp.tdwg.org) dataset datapackage.json file -- e.g. [here](https://github.com/magpiedin/CamtrapCheck/blob/main/input_data/camtrap-dp-55a9f7ea-f07f-4e1c-84f5-32ef46604189/datapackage.json)
- **output:** summaries & visual-things

Run the `camtrapSandbox.R` script by entering this in the RStudio console: `source("camtrapSandbox.R", verbose = TRUE)`

<img width="600" alt="camtrap-dp map" src="https://github.com/magpiedin/CamtrapCheck/assets/8563362/ee82c730-b9bd-421e-8699-8f22ea272bb4">


### [gridSandbox.R](https://github.com/magpiedin/CamtrapCheck/blob/main/gridSandbox.R)
- input: 3 CSVs in [input_data/tables](https://github.com/magpiedin/CamtrapCheck/tree/main/input_data/tables)
- output: 
  - map/chart of plants in Wild Mile modules (interactive and screenshot)
  - [plants_in_modules.csv](https://github.com/magpiedin/CamtrapCheck/tree/main/output_data) -- consolidated table of which plants are/were where in the Wild Mile modules
  
Run the `gridSandbox.R` script by entering this in the RStudio console: `source("gridSandbox.R", verbose = TRUE)`

<img width="600" alt="grid of plants on Wild Mile modules" src="https://github.com/magpiedin/CamtrapCheck/assets/8563362/49410a9f-1e30-4da5-84cb-a59dbeed5ca7">


### gridSandbox.R demo
See a demo of the gridSandbox map [here](https://kate-webbink.shinyapps.io/sandbox_app/)

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


