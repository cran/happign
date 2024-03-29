% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_wms_raster.R
\name{get_wms_raster}
\alias{get_wms_raster}
\title{Download WMS raster layer}
\usage{
get_wms_raster(x,
               apikey = "altimetrie",
               layer = "ELEVATION.ELEVATIONGRIDCOVERAGE",
               res = 25,
               filename = tempfile(fileext = ".tif"),
               crs = 2154,
               overwrite = FALSE,
               version = "1.3.0",
               styles = "",
               interactive = FALSE)
}
\arguments{
\item{x}{Object of class \code{sf} or \code{sfc}. Needs to be located in
France.}

\item{apikey}{\code{character}; API key from \code{get_apikeys()} or directly
from \href{https://geoservices.ign.fr/services-web-experts}{IGN website}.}

\item{layer}{\code{character}; layer name from
\code{get_layers_metadata(apikey, "wms")} or directly from
\href{https://geoservices.ign.fr/services-web-experts}{IGN website}.}

\item{res}{\code{numeric}; resolution in the unit of the coordinate system
(e.g. meter for 2154). See detail for more information about \code{res}.}

\item{filename}{\code{character} or \code{NULL}; filename or a open connection for
writing. (ex : "test.tif" or "~/test.tif"). If \code{NULL}, \code{layer} is used as
filename. Default drivers is ".tif" but all gdal drivers are supported,
see details for more info.}

\item{crs}{\code{numeric}, \code{character}, or object of class \code{sf} or \code{sfc}.
It is set to EPSG:2154 by default. See \code{\link[sf:st_crs]{sf::st_crs()}} for more detail.}

\item{overwrite}{If TRUE, output raster is overwrite.}

\item{version}{\code{character}; version of the service used. See details
for more info.}

\item{styles}{\code{character}; rendering style of the layer. Set to ""
by default. See details for more info.}

\item{interactive}{\code{logical}; If TRUE, interactive menu ask for
\code{apikey} and \code{layer}.}
}
\value{
\code{SpatRaster} object from \code{terra} package.
}
\description{
Download a raster layer from IGN Web Mapping Services (WMS).
To do that, it need a location giving by a shape, an apikey
and the name of layer. You can find those information from
\href{https://geoservices.ign.fr/services-web-experts}{IGN website}
or with \code{get_apikeys()} and \code{get_layers_metadata()}.
}
\details{
\itemize{
\item \code{res} : Warning, setting \code{res} higher than default layer resolution
multiplies the number of pixels without increasing
the precision. For example, the download of the BD Alti layer from
IGN will be optimal for a resolution of 25m.
\item \code{version} and \code{styles} arguments are detailed on
\href{https://geoservices.ign.fr/documentation/services/api-et-services-ogc/images-wms-ogc}{IGN documentation}
\item \code{filename} : All GDAL supported drivers can be found
\href{https://gdal.org/drivers/raster/index.html}{here}
\item \code{overwrite} : \verb{get_wms raster} always checks that \code{filename} does not
already exist. If it does, it is imported into R without further downloading
unless \code{overwrite} is set to \code{TRUE}.
}
}
\examples{
\dontrun{
library(sf)
library(tmap)

# Shape from the best town in France
penmarch <- read_sf(system.file("extdata/penmarch.shp", package = "happign"))

# For quick testing use interactive = TRUE
raster <- get_wms_raster(x = penmarch, interactive = TRUE)

# For specific data, choose apikey with get_apikey() and layer with get_layers_metadata()
apikey <- get_apikeys()[4]  # altimetrie
metadata_table <- get_layers_metadata(apikey, "wms") # all layers for altimetrie wms
layer <- metadata_table[2,1] # ELEVATION.ELEVATIONGRIDCOVERAGE

# Downloading digital elevation model from IGN
mnt_2154 <- get_wms_raster(penmarch, apikey, layer, res = 25)

# If crs is set to 4326, res is in degrees
mnt_4326 <- get_wms_raster(penmarch, apikey, layer, res = 0.0005, crs = 4326)

# Plotting result
tm_shape(mnt_4326)+
   tm_raster()+
tm_shape(penmarch)+
   tm_borders(col = "blue", lwd  = 3)
}
}
\seealso{
\code{\link[=get_apikeys]{get_apikeys()}}, \code{\link[=get_layers_metadata]{get_layers_metadata()}}
}
