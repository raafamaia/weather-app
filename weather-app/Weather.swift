//
//  Weather.swift
//  weather-app
//
//  Created by R. Maia on 24/09/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation
import SwiftyJSON

class Weather {
    
    //#MARK: Private Properties
    fileprivate var _day: String!
    fileprivate var _degrees: Int!
    fileprivate var _weather: String!
    fileprivate var _city: String!
    fileprivate var _description: String!
    fileprivate var _date: Date!
    fileprivate var _icon: UIImage!
    
    //#MARK: Getters/Setters
    var day: String {
        get {
            return _day
        }
    }
    
    var degrees: String {
        get {
            return "\(_degrees!)°"
        }
    }
    
    var weather: String {
        get {
            return _weather
        }
    }
    
    var city: String {
        get {
            return _city
        }
    }
    
    var description: String {
        get {
            return _description
        }
    }
    
    var date: Date {
        get {
            return _date
        }
    }
    
    var icon: UIImage {
        get {
            return _icon
        }
    }
    
    //#MARK: Constructors
    
    init(day: String, degrees: Int, weather: String, city: String, description: String) {
        self._weather = weather
        self._degrees = degrees
        self._day = day
        self._city = city
        self._description = description
    }
    
    init(json: JSON) {
        if let dt = json["dt"].double {
            self._date = Date(timeIntervalSince1970: dt)
            self._day = DateService.dayOfTheWeek(from: self._date)
        }
        
        self._description = json["weather"][0]["description"].string
        self._degrees = json["temp"][DateService.partOfDay].int
        
        if(DateService.partOfDay == "morn" || DateService.partOfDay == "day") {
            
            if self._description.contains("rain") {
                self._icon = UIImage(named: "rainy")
            } else if self._description.contains("snow") {
                self._icon = UIImage(named: "snowy")
            } else if self._description.contains("thunderstorm"){
                self._icon = UIImage(named: "thunderstorm")
            } else if self._description.contains("clouds") {
                self._icon = UIImage(named: "cloudy")
            } else if self._description.contains("clear") {
                self._icon = UIImage(named: "sunny")
            } else if self._description.contains("mist") || self._description.contains("windy") {
                self._icon = UIImage(named: "windy")
            } else {
                self._icon = UIImage(named: "not-found")
            }
        } else {
            if self._description.contains("rain") {
                self._icon = UIImage(named: "rainy")
            } else if self._description.contains("snow") {
                self._icon = UIImage(named: "snowy")
            } else if self._description.contains("thunderstorm"){
                self._icon = UIImage(named: "thunderstorm")
            } else if self._description.contains("clouds") {
                self._icon = UIImage(named: "cloudy-night")
            } else if self._description.contains("clear") {
                self._icon = UIImage(named: "clear-night")
            } else if self._description.contains("mist") || self._description.contains("windy") {
                self._icon = UIImage(named: "windy")
            } else {
                self._icon = UIImage(named: "not-found")
            }
        }
  
    }
}
