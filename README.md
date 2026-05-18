# 🪸 Data from: Establishing legal and benthic baselines of Taiwan’s coral ecosystems to inform effective conservation

This README file was generated on 2026/05/14 by Lauriane Ribas-Deulofeu (lauriane.ribas@gmail.com). Knit the taiwan_baselines.Rmd to generate html and extract R code (Latest update on 2026/05/14)

1. **Author Information**
   * First author
      * Name: Lauriane Ribas-Deulofeu
      * Affiliation 1: Institute of Oceanography, National Taiwan University, Taipei 10617, Taiwan
      * Affiliation 2: Ocean Center, National Taiwan University, Taipei 10617, Taiwan
   * Second author
      * Name: Yuting Vicky Lin
      * Affiliation: Institute of Oceanography, National Taiwan University, Taipei 10617, Taiwan
   * Third author
      * Name: Wanchien Victoria Hsiao
      * Affiliation 1: Institute of Oceanography, National Taiwan University, Taipei 10617, Taiwan
      * Affiliation 2: School of Biology, Faculty of Biological Sciences, University of Leeds, Leeds LS2 9JT, UK
   * Fourth author
      * Name: Yen-Li Liu
      * Affiliation: Institute of Oceanography, National Taiwan University, Taipei 10617, Taiwan
   * Fifth author
      * Name: Pierre-Alexandre Château
      * Affiliation: Department of Marine Environment and Engineering, National Sun Yat-sen University, Kaohsiung 80424, Taiwan
   * Sixth author
      * Name: Chih-Lin Wei
      * Affiliation 1: Institute of Oceanography, National Taiwan University, Taipei 10617, Taiwan
      * Affiliation 2: Ocean Center, National Taiwan University, Taipei 10617, Taiwan
   * Seventh author
      * Name: Wei-Jen Chen
      * Affiliation 1: Institute of Oceanography, National Taiwan University, Taipei 10617, Taiwan
      * Affiliation 2: Ocean Center, National Taiwan University, Taipei 10617, Taiwan
   * Eight & corresponding author
      * Name: Vianney Denis
      * Affiliation 1: Institute of Oceanography, National Taiwan University, Taipei 10617, Taiwan
      * Affiliation 2: Ocean Center, National Taiwan University, Taipei 10617, Taiwan. 
      * Email: [vianneydenis@ntu.edu.tw](mailto:vianneydenis@ntu.edu.tw)

3. **Date of data collection:** 2016-2023

4. **Geographic location of data collection:** Taiwan, West Pacific

5. **Funding sources that supported the collection of the data:**
   * Ministry of Science and Technology (MOST) of Taiwan
   * National Science and Technology Council (NSTC) of Taiwan
   * Ocean Conservation Administration (OCA) of Taiwan
   * Ocean Affairs Council (OAC) of Taiwan
   * Marine National Park of Taiwan
   * National Taiwan University

6. **Recommended citation for this dataset:** Ribas-Deulofeu L, Lin YV, Hsiao WV, Liu Y-L, Château P-A, Wei C-H, Chen W-J, Denis V (2026). Data from: Establishing legal and benthic baselines of Taiwan’s coral ecosystems to inform effective conservation [Dataset]. Zenodo. https://doi.org/XXXXX

7. **Associated manuscript:** Ribas-Deulofeu L, Lin YV, Hsiao WV, Liu Y-L, Château P-A, Wei C-H, Chen W-J, Denis V (2026). Establishing legal and benthic baselines of Taiwan’s coral ecosystems to inform effective conservation [under review in Regional Studies in Marine Science]

\[The data set and the R script are available through Zenodo (https://doi.org/XXXXX) and the GitHub repository (https://github.com/NTU-FRELab/Taiwan-baselines.git) in order to replicate our analyses]

## DESCRIPTION OF THE DATA AND FILE STRUCTURE

## DATA AND FILE OVERVIEW

1. **Description of the dataset**

This dataset is used to analyze benthic community and the legal framework regulating MPAs in Taiwan. 

2. **File list**

There are eight files and one sub-folder in the folder **Data**.

- **File 1: *Data summary - Regional Average Benthic Major Categories.csv*;** Description: Regional averages of benthic major categories (relative frequency).
- **File 2: *Dataset - Benthic composition (major cat.-mean) at survey locations (2016-2023).csv*;** Description: Average benthic composition at major categories (relative frequency) for each location and sampling event.
- **File 3: *Dataset - Benthic composition (morpho-funct. group-mean) and env. parameters at survey locations (2016-2023).csv*;** Description: Average benthic composition at morpho-functional group level (relative frequency) for each location and sampling event with their corresponding environmental conditions from files 4- 6
- **File 4: *EnvData - Monthly SST-max_(degree_celsius).tif*;** Description: Maximum monthly SST (°C; NOAA Global Coral Bleaching Monitoring; 5 km; 01/16/1986-12/16/2022). 
- **File 5: *EnvData - Monthly SST-min_(degree_celsius).tif*;** Description: Minimum monthly SST (°C; NOAA Global Coral Bleaching Monitoring; 5 km; 01/16/1986-12/16/2022). 
- **File 6: *EnvData - MonthlyPAR-mean_(Einstein.m2.d1).tif*;** Description: Average surface PAR (×10⁶ µmol m⁻² d⁻¹; VIIRSN/Suomi-NPP, NASA; 4 km;  01/15/2012-01/15/2022)
- **File 7: *Factor - Labels Morpho-functional group.csv*;** Description: Morpho-functional group abbreviations, full names, and corresponding major categories.
- **File 8: *Factor - Location level.csv*;** Description: Location-level metadata (e.g., survey dates, region, protection level).

- Subfolder: **Taiwan Landmass**; Description: Shapefile of Taiwan's landmass polygon used for map background. Comprises the five standard shapefile components (Files A-E).
    - **File A: *Taiwan.cpg* **
    - **File B: *Taiwan.dbf* **
    - **File C: *Taiwan.prj* **
    - **File D: *Taiwan.shp* **
    - **File E: *Taiwan.shx* **

### METHODOLOGICAL INFORMATION

A detailed description of data acquisition and processing can be found in the published manuscript in XXXX.

### DATA-FILE SPECIFIC INFORMATION

**File 1: *Data summary - Regional Average Benthic Major Categories.csv* **

1. Number of variables/columns: 14

2. Number of cases/rows: 10

3. Missing data codes: None

4. Variable List: 
    * **Region:** Study region name (8 regions + national average).
    * **Ascidian;	CCA;	Cyanobacteria;	Hydrozoan;	Macroalgae;	Octocoral;	Other.mobile.invertebrates;	Scleractinian;	Sponge;	Stable.substrate;	Turf;	Unstable.substrate;	Zoanthid:** Average proportion of the corresponding major category (relative frequency) per region and nationally.

**File 2: *Dataset - Benthic composition (major cat.-mean) at survey locations (2016-2023).csv* **

1. Number of variables/columns: 14

2. Number of cases/rows: 186

3. Missing data codes: None

4. Variable List: 
    * **Site_Depth_Date:** Study site name, depth and survey date
    * **Ascidian;	CCA;	Cyanobacteria;	Hydrozoan;	Macroalgae;	Octocoral;	Other mobile invertebrates;	Scleractinian;	Sponge;	Stable; substrate;	Turf;	Unstable substrate;	Zoanthid:** Average proportion of the corresponding major category (relative frequency) at the corresponding location and date.

**File 3: *Dataset - Benthic composition (morpho-funct. group-mean) and env. parameters at survey locations (2016-2023).csv* **

1. Number of variables/columns: 45

2. Number of cases/rows: 186

3. Missing data codes: None

4. Variable List:
Variable List: 
    * **Location:** Study location (Site_Depth) name and survey date.
    * **Depth:** Surveyed depth (m).
    * **Site_Depth_Date:** Study location (Site_Depth) name with survey date.
    * **Region:** Study region
    * **latitude:** Latitude (decimal degrees North).	
    * **longitude:** Longitude (decimal degrees East).
    * **Ascidian_erectsingle;	CCA;	Cyanobacteria_filamentous;	Hydrozoan_arborescent;	Hydrozoan_bushy;	Hydrozoan_encrusting;	Macroalgae_articulated_calcareous;	Macroalgae_corticated_foliose;	Macroalgae_corticated_macrophyte;	Macroalgae_Filamentous_Algae;	Octocoral_arborescent;	Octocoral_bushy;	Octocoral_clustered;	Octocoral_digitate;	Octocoral_encrusting;	Octocoral_fan;	Octocoral_lobate;	Octocoral_massive;	Octocoral_whip;	Other.mobile.invertebrates;	Scleractinian_arborescent;	Scleractinian_bushy;	Scleractinian_columnar;	Scleractinian_encrusting;	Scleractinian_foliose;	Scleractinian_massive;	Scleractinian_tabular;	Sponge_branching;	Sponge_encrusting;	Sponge_massive;	Stable.substrate;	Turf_Turf;	Unstable.substrate;	Zoanthid_encrusting;	Zoanthid_massive:**	Average proportion of the corresponding morpho-functional group (relative frequency) at the corresponding location and date.
    * **max.monthly.SST:** Maximum monthly SST (°C; NOAA Global Coral Bleaching Monitoring; 01/16/1986-12/16/2022) at study location.
    * **min.monthly.SST:** Minimum monthly SST (°C; NOAA Global Coral Bleaching Monitoring; 01/16/1986-12/16/2022) at study location.	
    * **PAR:** Average surface PAR (×10⁶ µmol m⁻² d⁻¹; VIIRSN/Suomi-NPP, NASA; 01/15/2012-01/15/2022) at study location.
    
**File 4: *EnvData - Monthly SST-max_(degree_celsius).tif* **

1. Number of variables/columns: 3

2. Number of cases/rows: 25921

3. Missing data codes: NA

4. Variable List:
    * **x:** Longitude (decimal degrees East).
    * **y:** Latitude (decimal degrees North).	
    * **min monthly SST:** Maximum monthly SST (°C; NOAA Global Coral Bleaching Monitoring; 5 km; 01/16/1986-12/16/2022) at the corresponding cellule.

**File 5: *EnvData - Monthly SST-min_(degree_celsius).tif* **

1. Number of variables/columns: 3

2. Number of cases/rows: 25921

3. Missing data codes: NA 

4. Variable List:
    * **x:** Longitude (decimal degrees East).
    * **y:** Latitude (decimal degrees North).	
    * **min monthly SST:** Minimum monthly SST (°C; NOAA Global Coral Bleaching Monitoring; 5 km; 01/16/1986-12/16/2022) at the corresponding cellule.

**File 6: *EnvData - MonthlyPAR-mean_(Einstein.m2.d1).tif* **

1. Number of variables/columns: 3

2. Number of cases/rows: 37249

3. Missing data codes: NA 

4. Variable List:
    * **x:** Longitude (decimal degrees East).
    * **y:** Latitude (decimal degrees North).	
    * **PAR:** Average surface PAR (×10⁶ µmol m⁻² d⁻¹; VIIRSN/Suomi-NPP, NASA; 4 km; 01/15/2012-01/15/2022) 

**File 7: *Factor - Labels Morpho-functional group.csv* **

1. Number of variables/columns: 4

2. Number of cases/rows: 36

3. Missing data codes: None

4. Variable List:
    * **Label:** OTU abbreviation used in CoralNet for quadrat annotation.
    * **FullLabelName:** OTU full name.
    * **MajorCategory:** Major category name
    * **MorphoFunctionalGroup:** Morpho-functional group name.

**File 8: *Factor - Location level.csv* **

1. Number of variables/columns: 14

2. Number of cases/rows: 186

3. Missing data codes: None

4. Variable List:
    * **ID:** Unique identifier for each sampling event.
    * **Country:** Country where the survey was conducted.	
    * **Region:** Study region.
    * **Site:** Study site name.	
    * **Depth:** Survey depth (m).
    * **Date:** Survey date.
    * **Transect replicate:** Number of transects surveyed per location.
    * **Site_Depth:**	Study location name.
    * **Site_Depth_Date:** Study location name and survey date.
    * **latitude:** Latitude (decimal degrees North).
    * **longitude:** Longitude (decimal degrees East).
    * **MPA_Protection:** Marine Protected Area status (Y= Yes; N= No)
    * **Protection_level:**	Protection level of the study location (Full, Partial, Unknown).
    * **MPA_recognized_by_OCA:** Whether the study location falls within an OCA-recognized MPA (Full, Partial, N=Not OCA MPA).

***

**Code/software**

The R software is required, along with the following packages to run the script: `tidyverse`, `dplyr`, `ggpubr`, `viridis`, `ggplot2`, `yarrr`,`multcompView`, `terra`, `sf`, `vegan`, `labdsv`, `dunn.test`, `RVAideMemoire`, `mgcv`, `library(`coin`.

**Data sources and references** 

  * Environmental data:
  
NASA Ocean Biology Processing Group (OBPG). (2025). VIIRSN Suomi-NPP Level-3 Mapped Photosynthetically Available Radiation (PAR) Data. NASA Ocean Color Web. https://oceancolor.gsfc.nasa.gov.

NOAA Coral Reef Watch. (2018). NOAA Coral Reef Watch Version 3.1 Daily Global 5-km Satellite Coral Bleaching Monitoring Data. College Park, Maryland, USA: NOAA Coral Reef Watch. https://coralreefwatch.noaa.gov.
  
  * Benthic Data:
  
Hsiao, W.V., Lin, Y.V., Lin, H.-T., Denis, V. (2021). Learning from differences: Abiotic determinism of benthic communities in Northern Taiwan. Mar. Environ. Res. 170, 105361. https://doi.org/10.1016/j.marenvres.2021.105361.

Lin, Y.V., Château, P.-A., Nozawa, Y., Wei, C.-L., Wunderlich, R.F., et al. (2024). Drivers of coastal benthic communities in a complex environmental setting. Mar. Pollut. Bull. 203, 116462. https://doi.org/10.1016/j.marpolbul.2024.116462.

Lin, Y.V., Hsiao, W.V., Chen, W., Denis, V. (2022). Habitat change and its consequences on reef fish specialization in biogeographic transition zones. J. Biogeogr. 49, 1549–1561. https://doi.org/10.1111/jbi.14450.

Lin, Y.V., Denis, V. (2019). Acknowledging differences: number, characteristics, and distribution of marine benthic communities along Taiwan coast. Ecosphere 10, e02803. https://doi.org/10.1002/ecs2.2803.

Liu, C.-H.E., Ribas-Deulofeu, L., Wu, M.-H.M., Chang, Y.-J., Denis, V. (2025). Patterns of reef fish energy flow in a transitional zone. Coral Reefs 44, 1573–1586. https://doi.org/10.1007/s00338-025-02725-7. 

Ribas-Deulofeu, L, Lin, Y.V., Hsiao, W.V., Liu, Y-.L. and Château, P-.A., et al. (PREPRINT; to EDIT ONCE ACCEPTED). Establishing legal and benthic baselines of Taiwan’s coral ecosystems to inform effective conservation. Available at SSRN: http://dx.doi.org/10.2139/ssrn.6465291.

