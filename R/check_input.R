#' check get_wms_raster input
#'
#' @param shape see get_wms_raster
#' @param apikey see get_wms_raster
#' @param layer_name see get_wms_raster
#' @param resolution see get_wms_raster
#' @param filename see get_wms_raster
#' @param crs see get_wms_raster
#' @param overwrite see get_wms_raster
#' @param version see get_wms_raster
#' @param styles see get_wms_raster
#' @param interactive see get_wms_raster
#'
#' @importFrom checkmate assert assert_character assert_choice assert_numeric
#' check_character check_class check_null check_choice
#' @importFrom sf st_crs
#'
#' @noRd
#'
check_get_wms_raster_input <- function(shape,
                                       apikey,
                                       layer_name,
                                       resolution,
                                       filename,
                                       crs,
                                       overwrite,
                                       version,
                                       styles,
                                       interactive){

   # shape should be from sf package class
   assert(check_class(shape, "sf"),
          check_class(shape, "sfc"))


   # apikey should be one from get_apikeys() but also character corresponding
   # to scan user key
   assert(check_choice(apikey, get_apikeys()),
          check_character(apikey,
                          pattern = "^[[:alnum:]]{24}$"))

   # layer_name
   assert_character(layer_name)

   # resolution
   assert_numeric(resolution)
   if(resolution < 0.20){
      warning("resolution param is less than 0.2 cm, not many",
              "ressources are that precise.",
              call. = F)
   }

   # filename
   assert(check_character(filename),
          check_null(filename))

   if (!is.null(filename)){
      filename_ext <- strsplit(basename(filename), split="\\.")[[1]] # split one point
      filename_ext <- filename_ext[length(filename_ext)] # get last element of the list
      ext <- c("tif", "png", "vrt", "ntf", "toc", "xml", "img", "gff")

      if(!(filename_ext %in% ext) ){
         stop("filename extension should be one of ",
              paste(ext, collapse = ", "), ".", call. = FALSE)
      }

   }

  # crs : can take any crs object
   tryCatch({st_crs(crs)},
            error = function(cnd){stop("Invalid crs : ", crs, call. = FALSE)},
            warning = function(cns){stop("Invalid crs : ", crs, call. = FALSE)})

   # version
   assert_character(version, pattern = "^[0-9]{1}\\.[0-9]{1}\\.[0-9]{1}$")

   # style
   assert_character(styles)
   # overwrite
   assert_choice(overwrite, c(TRUE, FALSE))

}
