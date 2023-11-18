## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(happign)
library(sf)

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  # Create or import a shape
#  penmarch <- get_apicarto_cadastre("29158", "commune")
#  
#  my_key <- "abc12efghi34j5k678lmnopq"
#  scan25_name <- "SCAN25TOUR_PYR-JPEG_WLD_WM"
#  
#  scan25 <- get_wms_raster(penmarch,
#                           apikey = my_key,
#                           layer = scan25_name,
#                           res = 1,   # To have full resolution
#                           filename = "SCAN25.tif") # This resource need to be downloaded on disk
#  
#  

