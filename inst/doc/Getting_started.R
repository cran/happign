## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center",
  fig.height = 4,
  fig.width = 6
)
options(rmarkdown.html_vignette.check_title = FALSE)

## ---- message = FALSE, warning = FALSE----------------------------------------
library(happign)
library(sf)
library(tmap)

## ---- echo = TRUE-------------------------------------------------------------
get_apikeys()

## -----------------------------------------------------------------------------
apikey <- get_apikeys()[1]
get_layers_metadata(apikey = apikey, data_type = "wfs")
get_layers_metadata(apikey = apikey, data_type = "wms")

## ---- eval=TRUE, include=TRUE-------------------------------------------------
penmarch_point <- st_sfc(st_point(c(-4.370, 47.800)), crs = 4326)
penmarch_borders <- get_wfs(shape = penmarch_point,
                            apikey = "administratif",
                            layer_name = "LIMITES_ADMINISTRATIVES_EXPRESS.LATEST:commune")

# Checking result
tm_shape(penmarch_borders) + # Borders of penmarch
   tm_polygons(alpha = 0, lwd = 2) +
tm_shape(penmarch_point) + # Point use to retrieve data
   tm_dots(col = "red", size = 2) +
   tm_add_legend(type = "symbol", label = "lat : -4.370, long : 47.800",
                 col = "red", size = 1) +
   tm_layout(main.title = "Penmarch borders from IGN",
             main.title.position = "center",
             legend.position = c("right", "bottom"),
             frame = FALSE)

## ---- eval=TRUE, include=TRUE-------------------------------------------------
dikes <- get_wfs(shape = penmarch_borders,
                 apikey = get_apikeys()[6],
                 layer_name = "BDCARTO_BDD_WLD_WGS84G:noeud_routier")

dikes <- st_intersection(penmarch_borders, dikes)

# Checking result
tm_shape(penmarch_borders) + # Borders of penmarch
   tm_borders(lwd = 2) +
tm_shape(dikes) + # Point use to retrieve data
   tm_dots(col = "red") +
   tm_add_legend(type = "symbol", label = "Road junction", col = "red") +
   tm_layout(main.title = "Road nodes recorded by the IGN in Penmarch",
             main.title.position = "center",
             legend.position = c("right", "bottom"),
             frame = FALSE)

## ---- eval=TRUE, include=TRUE-------------------------------------------------
apikey <- get_apikeys()[4]
layers_metadata <- get_layers_metadata(apikey, "wms")
dem_layer_name <- layers_metadata[2, "name"]

# mnt <- get_wms_raster(shape = penmarch_borders,
#                       apikey = apikey,
#                       layer_name = unlist(dem_layer_name),
#                       resolution = 25,
#                       filename = "temp",
#                       crs = 4326)
# 
# mnt[mnt < 0] <- NA # remove negative values in case of singularity
# names(mnt) <- "Elevation [m]" # Rename raster ie the title legend
# 
# 
# tm_shape(mnt) +
#    tm_raster(colorNA = NULL) +
# tm_shape(penmarch_borders)+
#    tm_borders(lwd = 2)+
# tm_layout(main.title = "DEM of Penmarch",
#           main.title.position = "center",
#           legend.position = c("right", "bottom"),
#           legend.bg.color = "white", legend.bg.alpha = 0.7,
#           frame = FALSE)
# 
# file.remove("temp_25m.tif")

