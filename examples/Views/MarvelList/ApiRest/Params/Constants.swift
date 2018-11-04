//
//  Constants.swift
//  examples
//
//  Created by Manuel Colmenero Navarro on 4/11/18.
//  Copyright © 2018 mcolmenero. All rights reserved.
//

import Foundation

// MARK :- Api Key
public let GLOBAL_API_KEY = "" // Put your data

// MARK :- Conection
public let GLOBAL_BASEURL_MARVEL_GATEWAY = "https://gateway.marvel.com"
public let GLOBAL_APPURL_REFERER = "" // Put your data
public let GLOBAL_BASEURL_MARVEL = "/v1/public/"

// MARK :- Access services
public let FETCH_URL_APIKEY = "?apikey="
public let FETCH_URL_HASH = "&hash="
public let FETCH_URL_AUTH = "/rest/auth"
public let FETCH_URL_CHARACTERS_LIST = "/v1/public/characters"
public let FETCH_URL_CHARACTERS_DETAIL = "/v1/public/characters/"

//Error Code
// 409 - Missing API Key - Occurs when the apikey parameter is not included with a request.
// 409 - Missing Hash - Occurs when an apikey parameter is included with a request, a ts parameter is present, but no hash parameter is sent. Occurs on server-side applications only.
// 409 - Missing Timestamp - Occurs when an apikey parameter is included with a request, a hash parameter is present, but no ts parameter is sent. Occurs on server-side applications only.
// 401 - Invalid Referer - Occurs when a referrer which is not valid for the passed apikey parameter is sent.
// 401 - Invalid Hash - Occurs when a ts, hash and apikey parameter are sent but the hash is not valid per the above hash generation rule.
// 405 - Method Not Allowed - Occurs when an API endpoint is accessed using an HTTP verb which is not allowed for that endpoint.
// 403 - Forbidden - Occurs when a user with an otherwise authenticated request attempts to access an endpoint to which they do not have access.

public let apiError401 = "Error 401."
public let apiError403 = "Error 403."
public let apiError405 = "Error 405."
public let apiError409 = "Error 409."
public let apiError500 = "Error 500."
public let noInternet = "Conexion not available."
