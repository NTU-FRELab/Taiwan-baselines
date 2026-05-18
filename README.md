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
    - **File A: *Taiwan.cpg***
    - **File B: *Taiwan.dbf***
    - **File C: *Taiwan.prj***
    - **File D: *Taiwan.shp***
    - **File E: *Taiwan.shx***

### METHODOLOGICAL INFORMATION

A detailed description of data acquisition and processing can be found in the published manuscript in XXXX.

### DATA-FILE SPECIFIC INFORMATION

**File 1: *Data summary - Regional Average Benthic Major Categories.csv* **
1. Number of variables/columns: 14

2. Number of cases/rows: 10

3. Missing data codes: None

4. Variable List: Region;	Ascidian;	CCA;	Cyanobacteria;	Hydrozoan;	Macroalgae;	Octocoral;	Other.mobile.invertebrates;	Scleractinian;	Sponge;	Stable.substrate;	Turf;	Unstable.substrate;	Zoanthid.

**File 2: *Dataset - Benthic composition (major cat.-mean) at survey locations (2016-2023).csv* **
1. Number of variables/columns: X

2. Number of cases/rows: X

3. Missing data codes: X

4. Variable List

**File 3: *Dataset - Benthic composition (morpho-funct. group-mean) and env. parameters at survey locations (2016-2023).csv* **
1. Number of variables/columns: X

2. Number of cases/rows: X

3. Missing data codes: X

4. Variable List

**File 4: *EnvData - Monthly SST-max_(degree_celsius).tif* **
1. Number of variables/columns: X

2. Number of cases/rows: X

3. Missing data codes: X

4. Variable List

**File 5: *EnvData - Monthly SST-min_(degree_celsius).tif* **
1. Number of variables/columns: X

2. Number of cases/rows: X

3. Missing data codes: X

4. Variable List

**File 6: *EnvData - MonthlyPAR-mean_(Einstein.m2.d1).tif* **
1. Number of variables/columns: X

2. Number of cases/rows: X

3. Missing data codes: X

4. Variable List

**File 7: *Factor - Labels Morpho-functional group.csv* **
1. Number of variables/columns: X

2. Number of cases/rows: X

3. Missing data codes: X

4. Variable List

**File 8: *Factor - Location level.csv* **
1. Number of variables/columns: X

2. Number of cases/rows: X

3. Missing data codes: X

4. Variable List
