//
//  Constants.swift
//  weather-app
//
//  Created by R. Maia on 24/09/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation

var BASE_URL: String! = "http://api.openweathermap.org/data/2.5/forecast/daily?"
var API_KEY: String! = "48420147bf2ea9eb0bc0c424123690ea"
var CELSIUS: String! = "units=metric"
var COUNT: String! = "ctn=5"

typealias DownloadComplete = () -> ()

