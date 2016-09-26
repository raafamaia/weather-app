//
//  DateService.swift
//  weather-app
//
//  Created by R. Maia on 25/09/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation

class DateService {
    
    static var partOfDay: String {
        get {
            let date = Date()
            let calendar = NSCalendar.current
            let hour = calendar.component(.hour, from: date)
        
            if 6 ..< 12 ~= hour {
                return "morn"
            } else if 17 ..< 20 ~= hour {
                return "eve"
            } else if 20 ..< 24 ~= hour || 0 ..< 6 ~= hour {
                return "night"
            } else {
                return "day"
            }
        }
    }
    
    static var currentDayOfTheWeek: String? {
        return dayLiteral(from: Date())
    }
    
    static func dayOfTheWeek(from: String, format: String) -> String! {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: from) {
            return dayLiteral(from: date)
        }
        
        return nil
    }
    
    static func format(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
    
    static func dayOfTheWeek(from: Date!) -> String {
        return dayLiteral(from: from)
    }
    
    static fileprivate func dayLiteral(from: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayOfWeekString = formatter.string(from: from)
        return dayOfWeekString

    }
}
