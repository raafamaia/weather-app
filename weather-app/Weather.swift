//
//  Weather.swift
//  weather-app
//
//  Created by R. Maia on 24/09/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation

class Weather {
    
    //#MARK: Private Properties
    fileprivate var _day: String!
    fileprivate var _degrees: String!
    fileprivate var _latitude: Int!
    fileprivate var _longitude: Int!
    fileprivate var _weather: String!
    fileprivate var _description: String!
    fileprivate var _city: String!
    
    fileprivate var _url: String {
        get {
            return "\(BASE_URL)lat=\(_latitude)&lon=\(_longitude)&APPID=\(API_KEY)"
        }
    }
    
    //#MARK: Getters/Setters
    var day: String {
        get {
            return _day
        }
    }
    
    var degrees: String {
        get {
            return _degrees
        }
    }
    
    var latitude: Int {
        get {
            return _latitude
        }
    }
    
    var longitude: Int {
        get {
            return _longitude
        }
    }
    
    //#MARK: Constructor
    init(lat: Int, lon: Int) {
        self._latitude = lat
        self._longitude = lon
    }
    
    //#MARK: Constructor
    func downloadWeather() {
        
    }
    
}
