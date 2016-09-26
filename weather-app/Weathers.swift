//
//  Weathers.swift
//  weather-app
//
//  Created by R. Maia on 24/09/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Weathers {
    
    //#MARK: Private Properties
    fileprivate var _weathers: [Weather]!
    fileprivate var _latitude: Double!
    fileprivate var _longitude: Double!
    fileprivate var _city: String!
    fileprivate var _description: String!
    
    fileprivate var _url: String {
        get {
            return "\(BASE_URL!)lat=\(_latitude!)&lon=\(_longitude!)&\(COUNT!)&\(CELSIUS!)&APPID=\(API_KEY!)"
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
    
    //#MARK: Constructors
    init(lat: Double, lon: Double){
        self._latitude = lat
        self._longitude = lon
    }
    
    //#MARK: Functions
    func downloadWeathers(complete: @escaping DownloadComplete) {

        Alamofire.request(self._url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                print(json)
                self._city = json["city"]["name"].string
                self._description = json["list"][0]["weather"][0]["description"].string
                self._weathers = json["list"].arrayValue.map(Weather.init)
                
                for _ in 1...2 {
                    self._weathers.remove(at: self._weathers.count - 1) //#FIX: API retornando 5 itens com count de 5
                }
                
                complete()
            
            case .failure(let err):
                print("Ops, something went wrong. Error: \(err)")
            }
        }
    }
}
