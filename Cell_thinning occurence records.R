library(geodata)
library(dismo)
library(raster)

?geodata
#occurrence record. Latitude and longitude only
occ_data <- read.csv("OccurrenceDat 2023.csv")
occ_data <- occ_data[,-1] #remove unwanted columns e.g X
head(occ_data)

#your environmental data using Raster
env_data1 <- getData('worldclim', var='bio', res=10)
env_data1[[1]]

#thin occurrence records using gridsample for raster
occ_thin <- dismo::gridSample(occ_data, env_data1[[1]], n=1) # thin to one occurrence record per cell in your raster file


#your environmental data using terra and geodata
library(terra)
# worldclim_global(var= "bio", res=10, path=".", version="2.1")
env_data2 <- list.files("F:/GitHub/Thin Occurrence/wc2.1_10m/", pattern=".tif", full.names = TRUE)
env_data2 <- rast(env_data2)

#thin occurrence records using gridsample for terra spat raster
occ_thin2 <- dismo::gridSample(occ_data, env_data2[[1]], n=1)

# save.image("F:/GitHub/Thin Occurrence/Renv.RData")