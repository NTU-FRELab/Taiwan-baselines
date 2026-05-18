# Title: Establishing legal and benthic baselines of Taiwan’s coral ecosystems to inform effective conservation
# Author: Ribas-Deulofeu L et al. 2026
# Date: 2026-05-14

### Packages
# Data formatting
library(tidyverse)
library(dplyr)

# Visualisation
library(ggpubr)
library(viridis)
library(ggplot2)
library(yarrr)
library(multcompView)
library(terra)
library(sf)

# Statistical analyses
library(vegan)
library(labdsv)
library(dunn.test)
library(RVAideMemoire)
library(mgcv)
library(coin)


### Dataset - Benthic composition and environmental data at study locations ###

# Benthic composition (morpho-functional group) with environmental data at study location (for GAMs)
BenthicMorphoFunctwithEnvVar<-read.csv("Data/Dataset - Benthic composition (morpho-funct. group-mean) and env. parameters at survey locations (2016-2023).csv", header = T, row.names = "Location")

# Subset without env. parameters for benthic analysis
#1. Morpho-functional group level
BenthicMorphoFunctnoEnvVar<-BenthicMorphoFunctwithEnvVar%>% select(-c(Site, Depth, Site_Depth_Date, Region, latitude, longitude, max.monthly.SST, min.monthly.SST, PAR))

#2. Major category level
BenthicMAjCat<-read.csv("Data/Dataset - Benthic composition (major cat.-mean) at survey locations (2016-2023).csv",header=T,row.names= "Site_Depth_Date")

### Factors - Study location and MPA protection level ###
LocationFactor<- read.csv("Data/Factor - Location Level.csv", header=T)

# Study site vector for mapping 
StudySite<-LocationFactor[,c(4:5,9:11)]
StudySiteVector<- vect(StudySite, geom=c("longitude", "latitude"), crs="+proj=longlat +datum=WGS84",keepgeom=T) 

# Define the custom factor order
#1. Region order
custom_orderRegion <- c("Dongsha","Kenting", "Lanyu", "Xiaoliuqiu", "Ludao","East","Penghu","North")
LocationFactor$Region <- factor(LocationFactor$Region, levels = custom_orderRegion) # apply custom order Region column

#2. MPA protection level
custom_orderOCA <- c("Full","Partial", "N")
custom_orderMPA <- c("Full","Partial", "Unknown")
LocationFactor$Protection_level<-factor(LocationFactor$Protection_level, levels = custom_orderMPA) # apply custom order to MPA protection level columns
LocationFactor$MPA_recognized_by_OCA <-factor(LocationFactor$MPA_recognized_by_OCA, levels = custom_orderOCA)

### Factor - Morpho-functional groups ###
FGroupFactor<-read.csv("Data/Factor - Labels Morpho-functional group.csv", header=T)

# Import environmental data
PARtif<-rast("Data/EnvData - MonthlyPAR-mean_(Einstein.m2.d1).tif")
SSTmintif<-rast("Data/EnvData - Monthly SST-min_(degree_celsius).tif")
SSTmaxtif<-rast("Data/EnvData - Monthly SST-max_(degree_celsius).tif")
Taiwan<- st_read('Data/Taiwan Landmass/Taiwan.shp')


PARtif <- as.data.frame(PARtif, xy = TRUE, na.rm = FALSE)
names(PARtif)[3] <- "PAR"   # rename the value column to PAR

SSTmintif <- as.data.frame(SSTmintif, xy = TRUE, na.rm = FALSE)
names(SSTmintif)[3] <- "min monthly SST"   

SSTmaxtif <- as.data.frame(SSTmaxtif, xy = TRUE, na.rm = FALSE)
names(SSTmaxtif)[3] <- "max monthly SST"  


PAR <- ggplot() +
  geom_raster(data = PARtif, aes(x = x, y = y, fill = PAR)) +
  scale_fill_viridis_c(option = "cividis", direction = 1, end = 1, na.value = "gray90", name="", breaks= c(27,30,33,36,39,42))+ 
      labs(
           x = "Longitude",
           y = "Latitude"
          ) +
  theme_bw() +
  theme(
         legend.position = "bottom",  # Place the legend under the plot
         legend.title = element_text(size = 10),  # Custom legend title size
         legend.text = element_text(size = 8)     # Custom legend text size
        ) +
  ggtitle(expression("Average PAR (x10^6 µmol"~ m^"-2 " ~ d^"-1"~")")) +
  geom_sf(data = Taiwan, linewidth=0.01, col="grey80")+
  geom_point(data = StudySite, aes(longitude,latitude), color = "#D22B2B", size = 1)

  
PAR2<-PAR+ggspatial::annotation_scale(
  location = "br",
  pad_x = unit(0.2, "in"), pad_y = unit(0.2, "in"),
  bar_cols = c("grey60", "white")
) +
  ggspatial::annotation_north_arrow(
    location = "tr", which_north = "true",
    pad_x = unit(0.01, "in"), pad_y = unit(0.01, "in"),
    style = ggspatial::north_arrow_nautical(
      fill = c("grey0", "white"),
      line_col = "grey20")
  )+
  coord_sf(xlim = c(116.4, 123.6), ylim = c(19.5, 26)) 


MinSST <- ggplot() +
  geom_raster(data = SSTmintif, aes(x = x, y = y, fill=`min monthly SST`)) +
  scale_fill_viridis_c(option = "mako", direction = 1, end = 1, na.value = "gray90", name="")+
  labs(
    x = "Longitude",
    y = "Latitude"
  ) +
  theme_bw() +
  theme(
    legend.position = "bottom",  # Place the legend under the plot
    legend.title = element_text(size = 10),  # Custom legend title size
    legend.text = element_text(size = 8)     # Custom legend text size
  ) +
  ggtitle(expression("Min monthly average SST (°C)")) +
  geom_sf(data = Taiwan, linewidth=0.01, col="grey80")+
  geom_rect(aes(xmin = 116.65, xmax = 117.00, ymin = 20.55, ymax = 20.80), fill = NA, color = "red", linewidth = 0.6)+ #dongsha
  geom_rect(aes(xmin = 120.65, xmax = 120.90, ymin = 21.75, ymax = 22.05), fill = NA, color = "red", linewidth = 0.6)+ #kenting
  geom_rect(aes(xmin = 120.33, xmax = 120.43, ymin = 22.28, ymax = 22.39), fill = NA, color = "red", linewidth = 0.6)+ #xiaoliuqiu
  geom_rect(aes(xmin = 121.46, xmax = 121.64, ymin = 21.97, ymax = 22.12), fill = NA, color = "red", linewidth = 0.6)+ #lanyu
  geom_rect(aes(xmin = 121.4, xmax = 121.55, ymin = 22.6, ymax = 22.7), fill = NA, color = "red", linewidth = 0.6)+ #ludao
  geom_rect(aes(xmin = 121.20, xmax = 122.00, ymin = 22.75, ymax = 24.70), fill = NA, color = "red", linewidth = 0.6)+ #east
  geom_rect(aes(xmin = 121.40, xmax = 122.10, ymin = 24.80, ymax = 25.70), fill = NA, color = "red", linewidth = 0.6)+ #north
  geom_rect(aes(xmin = 119.20, xmax = 119.80, ymin = 23.10, ymax = 23.90), fill = NA, color = "red", linewidth = 0.6) #penghu

MinSST2<-MinSST+ggspatial::annotation_scale(
  location = "br", pad_x = unit(0.2, "in"), pad_y = unit(0.2, "in"), bar_cols = c("grey60", "white")
  ) +
  ggspatial::annotation_north_arrow(
    location = "tr", which_north = "true",
    pad_x = unit(0.01, "in"), pad_y = unit(0.01, "in"),
    style = ggspatial::north_arrow_nautical(fill = c("grey0", "white"),line_col = "grey20")
    )+
  coord_sf(xlim = c(116.4, 123.6), ylim = c(19.5, 26)) 


  
MaxSST <- ggplot() +
  geom_raster(data = SSTmaxtif, aes(x = x, y = y, fill=`max monthly SST`)) +
  scale_fill_viridis_c(option = "turbo", direction = 1, begin = 0.6, na.value = "gray90", name="") +
  labs(
    x = "Longitude",
    y = "Latitude"
  ) +
  theme_bw() +
  theme(
    legend.position = "bottom", 
    legend.title = element_text(size = 10),  
    legend.text = element_text(size = 8))+ 
  ggtitle(expression("Max monthly average SST (°C)")) +
  geom_sf(data = Taiwan, linewidth=0.01, col="grey80") 
  #geom_sf(data = WildlifeSanctuary,  color = "black", fill=NA, linewidth = 1)+ 
  #geom_sf(data = NEScenicArea,  color = "black",fill=NA, linewidth = 1) +
  #geom_sf(data = NatureReserve,  color = "black",fill=NA, linewidth = 1) +
  #geom_sf(data = EastScenicArea_MarineResources,  color = "black",fill=NA, linewidth = 1) +
  #geom_sf(data = AquaticAnimalPlantBreedingConsArea,  color = "black",fill=NA, linewidth = 1) + 
  #geom_sf(data = ArtificialsReefs,  color = "black",fill=NA, linewidth = 1) +
  #geom_sf(data = ConservFishArea2,  color = "black",fill=NA,  linewidth = 1) +
  #geom_sf(data = subset(AllMPAs, merged_data$MPA_Type == "NationalParkSeaArea"), color = "black", linewidth = 1,fill=NA)

MaxSST2<-MaxSST+ggspatial::annotation_scale(
  location = "br", pad_x = unit(0.2, "in"), pad_y = unit(0.2, "in"), bar_cols = c("grey60", "white")
  ) +
  ggspatial::annotation_north_arrow(
    location = "tr", which_north = "true",
    pad_x = unit(0.01, "in"), pad_y = unit(0.01, "in"),
    style = ggspatial::north_arrow_nautical(fill = c("grey0", "white"),line_col = "grey20")
    )+
  coord_sf(xlim = c(116.4, 123.6), ylim = c(19.5, 26)) 

# Arrange environmental maps together
ggpubr::ggarrange(PAR2, MinSST2, MaxSST2, ncol=3, nrow = 1)

### Benthic patterns ###
# Regional summary
RegionalSummary<-read.csv("Data/Data summary - Regional Average Benthic Major Categories.csv")
RegionalSummary<-RegionalSummary[,c(1,3,5:7,9,11:14)]
RegionalSummary$Region <- as.factor(RegionalSummary$Region)

# National_average
National_avg <- colMeans(RegionalSummary[ , -1])

# Convert table to long format 
RegionalSummary_long <- RegionalSummary %>% 
  pivot_longer(
    cols = -Region,
    names_to = "major_category",
    values_to = "value")

# Turn the national_avg vector into a 2-column table
natavg_df <- data.frame(
  major_category = names(National_avg),
  national_avg   = as.numeric(National_avg)
)

# Attach the national averages
RegionalSummary_long <- RegionalSummary_long %>%
  left_join(natavg_df, by = "major_category")

# Round cover values
RegionalSummary_long$CoverRounded<-round((RegionalSummary_long$value*100), digits = 1)
RegionalSummary_long$NationalRounded<-round((RegionalSummary_long$national_avg*100), digits = 1)

# Define regions and their row ranges in data_long
regions <- list(
  "Dongsha"    = 1:9,
  "East"       = 10:18,
  "Ludao"      = 19:27,
  "Kenting"    = 28:36,
  "North"      = 37:45,
  "Lanyu"      = 46:54,
  "Penghu"     = 55:63,
  "Xiaoliuqiu" = 64:72
)

# Color palette
Palette<-c("#FA796C","#FF0000","#354823","#AC3E3F","#5BBCD6","#6C6A61","#ACA927","#00A08A","#296D9A")

# Single plotting function for circular plots
make_circular_plot <- function(RegionalSummary_long, region_name, show_legend = FALSE) {
  ggplot(RegionalSummary_long) +
    geom_hline(aes(yintercept = y), data.frame(y = c(0:6)*10), color = "lightgrey") +
    geom_col(
      aes(x = str_wrap(major_category, 5), y = CoverRounded, fill = major_category),
      position = "dodge2", show.legend = TRUE, alpha = .9
    ) +
    scale_fill_manual(values = Palette) +
    geom_point(
      aes(x = str_wrap(major_category, 5), y = NationalRounded),
      size = 2, color = "gray12"
    ) +
    geom_segment(
      aes(x = str_wrap(major_category, 5), y = 0,
          xend = str_wrap(major_category, 5), yend = 60),
      linetype = "dashed", color = "gray12"
    ) +
    coord_polar() +
    xlab("") +                        #removes x-axis label
    ylab("") +
    theme_void() +                    #removes grey background and axes
    theme(
      axis.text.x = element_text(size=7),   #keeps the category name labels around the circle
      legend.position = if (show_legend) "bottom" else "none"
        ) +
    ggtitle(region_name)
}

# Generate all plots in one loop
plots <- lapply(names(regions), function(name) {
  RegionalSummary_long <- RegionalSummary_long[regions[[name]], ]
  is_last <- name == tail(names(regions), 1)   # only last plot gets legend
  make_circular_plot(RegionalSummary_long, name, show_legend = FALSE)
})

# Arrange all together with legend below
# First 4 regions
ggpubr::ggarrange(
  plotlist = plots[1:4],
  ncol = 2, nrow = 2,
  common.legend = TRUE,
  legend = "bottom"
)

# Last 4 regions
ggpubr::ggarrange(
  plotlist = plots[5:8],
  ncol = 2, nrow = 2,
  common.legend = TRUE,
  legend = "bottom"
) 

### Regional differences ###
# Distance matrix
dis1<- vegdist(BenthicMorphoFunctnoEnvVar, method='bray') 
mod<-betadisper (dis1,LocationFactor$Region) # multivariate homogeneity of groups dispersions on untransformed data (site Level)  
permutest (mod, pairwise=T,permutations = 9999)
Tukey<-TukeyHSD(mod) # pairwise comparison

#Get superscript letter from Tukey HDS results assigned to each region
exp_lettersTUKEY <- multcompLetters(Tukey$group[,4])

#PERMANOVA
permanovaRegion<-adonis2(formula=BenthicMorphoFunctnoEnvVar~Region, data=LocationFactor, permutations=9999, method='bray') # Permutational Multivariate Analysis of Variance using bray-curtis distances  
permanovaRegion 

#Pairwise PERMANOVA
set.seed(1)
pairwise.perm.manova(vegdist(BenthicMorphoFunctnoEnvVar,"bray", nperm = 999), LocationFactor$Region)

# Create the boxplot with specified colors
BoxplotRegion<-boxplot(mod, col = c("#6C261C","#CC201B","#FB7069","#F69572","#F1BB7B","#50A45C","#354800","#296D9A"),
        names = c("Dongsha","Kenting", "Lanyu", "Xiaoliuqiu", "Ludao","East","Penghu","North"), xlab = "Region", las=2)
BoxplotRegion

# Add Tukey HSD letters above the boxplots
# Create a vector of superscript letters for each group
superscript_letters <- c("c", "a,b,c", "a,b", "b", "a,b,c", "a,c", "c", "a,b") #superscript letter order correspond to pairwise permutest results

# Add superscript letters above each boxplot
for (i in 1:length(custom_orderRegion)) {
  mtext(paste0("(", superscript_letters[i], ")"), side = 3, line = 0.5, at = i, adj = 0.5, cex = 1)
}

set.seed(1)
#require("latex2exp")
nmds1site <- metaMDS(BenthicMorphoFunctnoEnvVar, dist='bray', type='n', try=50) 

par(mar = c(4, 4, 2, 1))  # fix margins
plot(0, main=bquote("nMDS using Bray-curtis distance"), xlim=c(-1.2,0.8), ylim=c(-0.8,0.8), xlab="NMDS1", ylab="NMDS2") 

points(nmds1site, 'sites', pch=18, col="#354800",cex=1.5,select=LocationFactor$Region=='Penghu') # add transects from Penghu
points(nmds1site, 'sites', pch=8, col="#50A45C",select=LocationFactor$Region=='East')# add transects from Green Island
points(nmds1site, 'sites', pch=19, col="#296D9A",select=LocationFactor$Region=='North') # add transects from North Taiwan
points(nmds1site, 'sites', pch=15, col="#CC201B",select=LocationFactor$Region=='Kenting') # add transects from Kenting
points(nmds1site, 'sites', pch=25, bg="#F69572", col="#F69572",select=LocationFactor$Region=='Xiaoliuqiu')
points(nmds1site, 'sites', pch=17, col="#FB7069" ,select=LocationFactor$Region=='Lanyu')
points(nmds1site, 'sites', pch=12, col="#F1BB7B",select=LocationFactor$Region=='Ludao')
points(nmds1site, 'sites', pch=12, col="#6C261C",select=LocationFactor$Region=='Dongsha')

text(nmds1site, 'species', cex=0.7,) # visualize species names

#ordispider (nmds1site, LocationFactor$Region, col=c("#6C261C","#50A45C","#F1BB7B","#CC201B","#296D9A","#FB7069","#354800","#F69572")) # position centroids
ordiellipse(nmds1site, LocationFactor$Region, col=c("#6C261C","#CC201B","#FB7069","#F69572","#F1BB7B","#50A45C","#354800","#296D9A"))
text(x=0.8, y=0.8,c("stress:                   ",round(nmds1site$stress,2)))
# Add legend for regions
legend("bottomleft", 
       legend = c("North", "Penghu", "East", "Ludao", "Xiaoliuqiu", "Lanyu", "Kenting", "Dongsha"),
       pch = c(19, 18, 8, 12, 25, 17, 15, 12),
       col = c("#296D9A","#354800","#50A45C","#F1BB7B","#F69572","#FB7069","#CC201B","#6C261C"),
       cex = 0.6,       
       pt.cex = 0.7,     
       title = "Region",
       title.cex = 0.7)  
             

# Dufrêne and Legendre indicator species analyses on morpho-functional groups
IndMajCat<-indval(BenthicMorphoFunctnoEnvVar, LocationFactor$Region)

# Combine results into a dataframe
IndVal_results <- data.frame(
  species   = names(IndMajCat$maxcls),
  region    = IndMajCat$maxcls,        # assigned cluster/region
  indval    = IndMajCat$indcls,        # indicator value
  pval      = IndMajCat$pval           # significance
)

# Assign Region name to their corresponding cluster
IndVal_results$region_name <- levels(LocationFactor$Region)[IndVal_results$region]

# Filter significant indicative groups (p<0.05)
IndVal_sig <- IndVal_results[IndVal_results$pval < 0.05, ]

# Sort by region then by indval
IndVal_sig <- IndVal_sig[order(IndVal_sig$region, -IndVal_sig$indval), ]
print(IndVal_sig)

### GAMs ###
# Selected env. parameters
# A. Latitude
fitLat<-ordisurf(nmds1site,BenthicMorphoFunctwithEnvVar$latitude, plot=FALSE)
summary(fitLat)

# B. PAR
fitPAR<-ordisurf(nmds1site,BenthicMorphoFunctwithEnvVar$PAR, plot=FALSE)
summary(fitPAR)

# C. Minimum monthly SST
fitTempMin<-ordisurf(nmds1site,BenthicMorphoFunctwithEnvVar$min.monthly.SST, plot=FALSE)
summary(fitTempMin)

# D. Maximum monthly SST
fitTempMax<-ordisurf(nmds1site,BenthicMorphoFunctwithEnvVar$max.monthly.SST, plot=FALSE)
summary(fitTempMax)

par(mfrow=c(2,2), pty="s", mar=c(4,4,2,1))
# Plot GAMs onto the nMDS
# Extract nmds scores at the top of this chunk
scores_sites <- as.data.frame(vegan::scores(nmds1site, display="sites"))

# Define each GAM plot's parameters in a list
gam_plots <- list(
  list(var  = BenthicMorphoFunctwithEnvVar$latitude,
       col  = "grey",
       main = "A. Latitude",
       stat = c("F= 6.5", "p-value <0.001", "deviation explained= 26.9%")),
  list(var  = BenthicMorphoFunctwithEnvVar$PAR,
       col  = "grey25",
       main = bquote("B. PAR"~(x10^6*mu~mol%.%m^-2%.%d^-1)),
       stat = c("F= 7.5", "p-value <0.001", "deviation explained= 29.0%")),
  list(var  = BenthicMorphoFunctwithEnvVar$min.monthly.SST,
       col  = "lightblue",
       main = bquote("C. Minimum monthly SST ("*degree*"C)"),
       stat = c("F= 4.6", "p-value <0.001", "deviation explained= 21.1%")),
  list(var  = BenthicMorphoFunctwithEnvVar$max.monthly.SST,
       col  = "#ffb09c",
       main = bquote("D. Maximum monthly SST ("*degree*"C)"),
       stat = c("F= 4.5", "p-value <0.001", "deviation explained= 20.9%"))
)

# Single loop over the 4 plots
for (p in gam_plots) {
  plot(0, main=p$main, xlim=c(-1,0.5), ylim=c(-0.7,0.9), xlab="NMDS1", ylab="NMDS2")
  ordisurf(nmds1site, p$var, col=p$col, add=TRUE)
  legend(x=-1, y=-0.5,    
       legend=p$stat,
       cex=0.8, bty="n", title="GAM", title.adj=0.15, adj=0,
       xpd=FALSE)
  points(scores_sites[LocationFactor$Region=='Penghu',],     pch=18, col="#354800", cex=1.5)
  points(scores_sites[LocationFactor$Region=='East',],       pch=8,  col="#50A45C")
  points(scores_sites[LocationFactor$Region=='North',],      pch=19, col="#296D9A")
  points(scores_sites[LocationFactor$Region=='Kenting',],    pch=15, col="#CC201B")
  points(scores_sites[LocationFactor$Region=='Xiaoliuqiu',], pch=25, col="#F69572", bg="#F69572")
  points(scores_sites[LocationFactor$Region=='Lanyu',],      pch=17, col="#FB7069")
  points(scores_sites[LocationFactor$Region=='Ludao',],      pch=12, col="#F1BB7B")
  points(scores_sites[LocationFactor$Region=='Dongsha',],    pch=12, col="#6C261C")
  legend("topleft",
         legend=c("North","Penghu","East","Ludao","Xiaoliuqiu","Lanyu","Kenting","Dongsha"),
         pch=c(19,18,8,12,25,17,15,12),
         col=c("#296D9A","#354800","#50A45C","#F1BB7B","#F69572","#FB7069","#CC201B","#6C261C"),
         cex=0.8, pt.cex=0.9, title="Region", title.cex=0.9)
}

par(mfrow=c(1,1), pty="m")  # reset

BenthicMAjCat$SclenCoralPercent<-(BenthicMAjCat$Scleractinian)*100
BenthicMAjCat$CCAPercent<-(BenthicMAjCat$CCA)*100
BenthicMAjCat$TurfPercent<-(BenthicMAjCat$Turf)*100
head(BenthicMAjCat)

# List benthic variables
vars  <- list(
  list(var="SclenCoralPercent", ylab="Scleractinian cover (%)", main="Scleractinian"),
  list(var="CCAPercent",        ylab="CCA cover (%)",           main="CCA"),
  list(var="TurfPercent",       ylab="Turf cover (%)",          main="Turf")
)

# Boxplot  
### 1.  All identified MPAs (n=248)  vs unprotected locations 
for (p in vars) {
  pirateplot(formula = as.formula(paste0("BenthicMAjCat$", p$var, " ~ LocationFactor$MPA_recognized_by_OCA")),
             data=BenthicMAjCat, bean.b.o=0.25, bean.f.o=0.25, point.o=0.25,
             inf.method="sd", ylim=c(0,80), gl=c(0,10,20,30,40,50,60,70,80),
             xlab="Protection level", ylab=p$ylab, main=p$main,
             cap.beans=TRUE, theme=2, cex.lab=1.3, yaxt="n", xaxt="n",
             pal=c("#296D9A","#50A45C","#CC201B"))
  axis(2, at=seq(0,80,by=10), labels=format(seq(0,80,by=10), nsmall=1), cex.axis=1.3)
  axis(1, at=1:3, labels=c("Full","Partial","Not OCA MPA"), cex.axis=1.3)
}

### 2. OCA recognized MPAs (n=70) vs other locations
for (p in vars) {
  pirateplot(formula = as.formula(paste0("BenthicMAjCat$", p$var, " ~ LocationFactor$MPA_recognized_by_OCA")),
             data=BenthicMAjCat, bean.b.o=0.25, bean.f.o=0.25, point.o=0.25,
             inf.method="sd", ylim=c(0,80), gl=c(0,10,20,30,40,50,60,70,80),
             xlab="Protection level", ylab=p$ylab, main=p$main,
             cap.beans=TRUE, theme=2, cex.lab=1.3, yaxt="n", xaxt="n",
             pal=c("#296D9A","#50A45C","#CC201B"))  
  axis(2, at=seq(0,80,by=10), labels=format(seq(0,80,by=10), nsmall=1), cex.axis=1.3)
  axis(1, at=1:3, labels=c("Full","Partial","Not OCA MPA"), cex.axis=1.3)
}
 

# List benthic variables
vars2 <- c("SclenCoralPercent", "CCAPercent", "TurfPercent")

#Permutation based Kruskal-Wallis and pairwise Wilcoxon permutation test
### 1.  All identified MPAs (n=248)  vs unprotected locations 
for (v in vars2) {
  cat("\n###", v, "- Protection level ###\n")
  set.seed(1)
  print(adonis2(as.formula(paste0("BenthicMAjCat$", v, " ~ LocationFactor$Protection_level")),
                permutations=9999, method="bray"))
  print(pairwise.wilcox.test(BenthicMAjCat[[v]], LocationFactor$Protection_level,
                              p.adjust.method="bonf"))
}

### OCA recognized MPAs (n=70) vs other locations
# Scleractinian Coral 
for (v in vars2) {
  cat("\n###", v, "- OCA MPAs ###\n")
  set.seed(1)
  print(adonis2(as.formula(paste0("BenthicMAjCat$", v, " ~ LocationFactor$MPA_recognized_by_OCA")),
                permutations=9999, method="bray"))
  print(pairwise.wilcox.test(BenthicMAjCat[[v]], LocationFactor$MPA_recognized_by_OCA,
                              p.adjust.method="bonf"))
}
