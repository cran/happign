structure(list(method = "GET", url = "https://apicarto.ign.fr/api/cadastre/parcelle?code_insee=29158&section=AW&numero=0010&source_ign=PCI&_start=0&_limit=500", 
    status_code = 200L, headers = structure(list(Date = "Sun, 11 Aug 2024 14:49:02 GMT", 
        `Content-Type` = "application/json; charset=utf-8", `Content-Length` = "984", 
        Connection = "keep-alive", `X-Powered-By` = "Express", 
        `Access-Control-Allow-Origin` = "*", `Cache-Control` = "private, no-cache, no-store, must-revalidate", 
        Expires = "-1", Pragma = "no-cache", Vary = "Origin", 
        `Access-Control-Allow-Credentials` = "true", ETag = "W/\"3d8-q0R8uatpeyWevuhFebjhT5kI5C4\"", 
        `Strict-Transport-Security` = "max-age=31536000; includeSubDomains"), class = "httr2_headers"), 
    body = charToRaw("{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"id\":\"parcelle.471067\",\"geometry\":{\"type\":\"MultiPolygon\",\"coordinates\":[[[[-4.36423811,47.80648614],[-4.36447855,47.80614593],[-4.36453912,47.8061376],[-4.36481078,47.80612753],[-4.36479465,47.80621532],[-4.36472085,47.80634571],[-4.3646664,47.80642616],[-4.36461325,47.80648302],[-4.36450563,47.80661446],[-4.36439687,47.80655397],[-4.36431661,47.8065094],[-4.36428045,47.80649342],[-4.36423811,47.80648614]]]]},\"geometry_name\":\"geom\",\"properties\":{\"numero\":\"0010\",\"feuille\":1,\"section\":\"AW\",\"code_dep\":\"29\",\"nom_com\":\"Penmarch\",\"code_com\":\"158\",\"com_abs\":\"000\",\"code_arr\":\"000\",\"idu\":\"29158000AW0010\",\"code_insee\":\"29158\",\"contenance\":1255},\"bbox\":[-4.36481078,47.80612753,-4.36423811,47.80661446]}],\"totalFeatures\":1,\"numberMatched\":1,\"numberReturned\":1,\"timeStamp\":\"2024-08-11T14:49:02.278Z\",\"crs\":{\"type\":\"name\",\"properties\":{\"name\":\"urn:ogc:def:crs:EPSG::4326\"}},\"bbox\":[-4.36481078,47.80612753,-4.36423811,47.80661446]}"), 
    request = structure(list(url = "https://apicarto.ign.fr/api/cadastre/parcelle?code_insee=29158&section=AW&numero=0010&source_ign=PCI&_start=0&_limit=500", 
        method = NULL, headers = list(), body = NULL, fields = list(), 
        options = list(ssl_verifypeer = 0), policies = list()), class = "httr2_request"), 
    cache = new.env(parent = emptyenv())), class = "httr2_response")
