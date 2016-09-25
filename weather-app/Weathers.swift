//
//  Weathers.swift
//  weather-app
//
//  Created by R. Maia on 24/09/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation
import Alamofire

class Weathers {
    
    //#MARK: Private Properties
    fileprivate var _weathers: [Weather]!
    fileprivate var _latitude: Double!
    fileprivate var _longitude: Double!
    fileprivate var _city: String!
    fileprivate var _description: String!
    
    fileprivate var _url: String {
        get {
            return "\(BASE_URL!)lat=\(_latitude!)&lon=\(_longitude!)&APPID=\(API_KEY!)"
        }
    }
    
    //#MARK: Private Properties
    var count: Int {
        get {
            return _weathers.count
        }
    }
    
    var list: [Weather] {
        get {
            return _weathers
        }
    }
    
    //#MARK: Constructors
    init(lat: Double, lon: Double){
        self._latitude = lat
        self._longitude = lon
    }
    
    //#MARK: Functions
    func downloadWeathers(complete: @escaping DownloadComplete) {
        Alamofire.request(self._url).responseJSON { response in
            print(response)
        }
    }
}
