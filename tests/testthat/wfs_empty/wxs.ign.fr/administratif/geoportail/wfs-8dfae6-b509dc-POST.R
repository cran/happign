structure(list(method = "POST", url = "https://wxs.ign.fr/administratif/geoportail/wfs?service=WFS&version=2.0.0&request=GetFeature&outputFormat=json&srsName=EPSG%3A4326&typeName=LIMITES_ADMINISTRATIVES_EXPRESS.LATEST%3Acommune&startindex=0&count=1000", 
    status_code = 200L, headers = structure(list(date = "Thu, 03 Aug 2023 10:21:59 GMT", 
        `content-type` = "application/json;charset=UTF-8", `transfer-encoding` = "chunked", 
        `x-frame-options` = "SAMEORIGIN", `content-disposition` = "inline; filename=features.json", 
        `wl-original-content-type` = "application/json;charset=UTF-8", 
        `cache-control` = "public, max-age=1814400", `access-control-allow-methods` = "GET, POST", 
        `access-control-max-age` = "43200", `access-control-allow-origin` = "*"), class = "httr2_headers"), 
    body = charToRaw("{\"type\":\"FeatureCollection\",\"features\":[],\"totalFeatures\":0,\"numberMatched\":0,\"numberReturned\":0,\"timeStamp\":\"2023-08-03T10:21:59.594Z\",\"crs\":null}")), class = "httr2_response")
