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
    fileprivate var _weather: String!
    
    
    
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
    
    var weather: String {
        get {
            return _weather
        }
    }
    
    //#MARK: Constructor
    init(day: String, degrees: String, weather: String) {
        self._weather = weather
        self._degrees = degrees
        self._day = day
    }
    
}
