#' @title Download WMTS raster tiles
#'
#' @description
#' Download an RGB raster layer from IGN Web Map Tile Services (WMTS).
#' WMTS focuses on performance and can only query pre-calculated
#' tiles.
#'
#' @usage
#' get_wmts(x,
#'          layer = "ORTHOIMAGERY.ORTHOPHOTOS",
#'          zoom = 10L,
#'          crs = 2154,
#'          filename = tempfile(fileext = ".tif"),
#'          verbose = FALSE,
#'          overwrite = FALSE,
#'          interactive = FALSE)
#'
#' @param x Object of class `sf` or `sfc`. Needs to be located in
#' France.
#' @param layer `character`; layer name from
#' `get_layers_metadata(apikey, "wms")` or directly from
#' [IGN website](https://geoservices.ign.fr/services-web-experts).
#' @param zoom `integer` between 0 and 21; at low zoom levels, a small set of
#' map tiles covers a large geographical area. In other words, the smaller
#' the zoom level, the less precise the resolution. For conversion between zoom
#' level and resolution see
#' [WMTS IGN Documentation](https://geoservices.ign.fr/documentation/services/services-geoplateforme/diffusion#70062)
#' @param crs `numeric`, `character`, or object of class `sf` or `sfc`.
#' It is set to EPSG:2154 by default. See [sf::st_crs()] for more detail.
#' @param filename `character` or `NULL`; filename or a open connection for
#' writing. (ex : "test.tif" or "~/test.tif"). If `NULL`, `layer` is used as
#' filename. Default drivers is ".tif" but all gdal drivers are supported,
#' see details for more info.
#' @param verbose `boolean`; if TRUE, message are added.
#' @param overwrite If TRUE, output raster is overwrite.
#' @param interactive `logical`; If TRUE, interactive menu ask for
#' `apikey` and `layer`.
#'
#' @return
#' `SpatRaster` object from `terra` package.
#'
#' @importFrom sf gdal_utils st_bbox st_crs st_transform
#' @importFrom terra rast RGB<-
#'
#' @seealso
#' [get_apikeys()], [get_layers_metadata()]
#'
#' @export
#'
#'@examples
#' \dontrun{
#' library(sf)
#' library(tmap)
#'
#' penmarch <- read_sf(system.file("extdata/penmarch.shp", package = "happign"))
#'
#' # Get orthophoto
#' layers <- get_layers_metadata("wmts", "ortho")$Identifier
#' ortho <- get_wmts(penmarch, layer = layers[1], zoom = 21)
#' plotRGB(ortho)
#'
#' # Get all available irc images
#' layers <- get_layers_metadata("wmts", "orthohisto")$Identifier
#' irc_names <- grep("irc", layers, value = TRUE, ignore.case = TRUE)
#'
#' irc <- lapply(irc_names, function(x) get_wmts(penmarch, layer = x, zoom = 18)) |>
#'    setNames(irc_names)
#'
#' # remove empty layer (e.g. only NA)
#' irc <- Filter(function(x) !all(is.na(values(x))), irc)
#'
#' # plot
#' all_plots <- lapply(irc, plotRGB)
#'
#'}
get_wmts <- function(x,
                     layer = "ORTHOIMAGERY.ORTHOPHOTOS",
                     zoom = 10L,
                     crs = 2154,
                     filename = tempfile(fileext = ".tif"),
                     verbose = FALSE,
                     overwrite = FALSE,
                     interactive = FALSE){

   # check x ----
   # x
   if (!inherits(x, c("sf", "sfc"))) {
      stop("`x` must be of class sf or sfc.", call. = F)
   }

   # interactive mode ----
   # if TRUE menu ask for apikey and layer name
   if (interactive){
      choice <- interactive_mode("wmts")
      layer <- choice$layer
   }

   # check other input ----
   # layer
   if (!inherits(layer, "character")) {
      stop("`layer` must be of class character.", call. = F)
   }

   # zoom
   if(!inherits(zoom, c("numeric", "integer"))){
      stop("`zoom` must be of class numeric or integer", call. = F)
   }
   if (is.numeric(zoom)){
      zoom <- as.integer(zoom)
   }

   # if no filename provided, layer is used by removing non alphanum character
   if (is.null(filename)){
      filename <- gsub("[^[:alnum:]]", "_", layer)
      filename <- paste0(filename, ".tif") # Save as geotiff by default
   }

   # overwrite ----
   # if filename exist and overwrite is set to FALSE, raster is loaded
   if (file.exists(filename) && !overwrite) {
      rast <- rast(filename)
      message("File already exists at ", filename," therefore is loaded.\n",
              "Set overwrite to TRUE to download it again.")
      return(rast)
   }

   # prepare param for gdal warp ----
   bbox <- st_transform(x, crs) |> st_bbox()
   crs <- st_crs(bbox)$srid

   url <- sprintf("WMTS:https://data.geopf.fr/wmts?SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetCapabilities")

   options <- c("-te", bbox$xmin, bbox$ymin, bbox$xmax, bbox$ymax,
                "-te_srs", crs,
                "-t_srs", crs,
                "-oo", paste0("ZOOM_LEVEL=", zoom),
                "-oo", paste0("LAYER=", layer),
                "-srcnodata", "None", # explain gdal that dataset don't have nodata value
                "-dstnodata", 0, # O become NA value
                if (overwrite) "-overwrite" else NULL)

   tryCatch({
      gdal_utils("warp",
                 source = url,
                 destination = filename,
                 quiet = !verbose,
                 options = options,
                 # local disk cache is present in the autogenerated XML
                 # GDAL_ENABLE_WMS_CACHE=NO is used to override it
                 # see https://gdal.org/drivers/raster/wmts.html
                 config_options = c(GDAL_ENABLE_WMS_CACHE = "NO"))
   }, error = function(e) {
      stop("Check that `layer` is valid",  call. = F)
   })

   # import and set rast to RGB, so you can use plot insteead of terra::plotRGB
   rast <- rast(filename)
   RGB(rast) <- c(1, 2, 3, 4)
   names(rast) <- c("red", "green", "blue", "alpha")

   if (sum(minmax(allNA(rast))) == 2){
      message("Raster is empty, NULL is returned")
      return(NULL)
   }

   return(rast)

}
