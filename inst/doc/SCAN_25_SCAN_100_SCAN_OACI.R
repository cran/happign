## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(happign)

## ---- eval = FALSE, echo = TRUE-----------------------------------------------
#  # Create or import a shape
#  shape <- st_polygon(list(matrix(c(-4.373937, 47.79859,
#                                    -4.375615, 47.79738,
#                                    -4.375147, 47.79683,
#                                    -4.373937, 47.79859),
#                                  ncol = 2, byrow = TRUE)))
#  shape <- st_sfc(shape, crs = st_crs(4326))
#  
#  my_key <- "abc12efghi34j5k678lmnopq"
#  scan25_name <- "SCAN25TOUR_PYR-JPEG_WLD_WM"
#  
#  scan25 <- get_wms_raster(shape,
#                           apikey = my_key,
#                           layer_name = scan25_name,
#                           resolution = NULL,   # To have full resolution
#                           filename = "SCAN25") # This resource need to be downloaded on disk
#  
#  

