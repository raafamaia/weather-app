//
//  WeatherTableViewCell.swift
//  weather-app
//
//  Created by R. Maia on 24/09/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    //#MARK: @IBOutlets
    
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var degrees: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    //#MARK: Properties
    
    fileprivate var _weather: Weather!
    
    //#MARK: Events
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //#MARK: Functions
    
    func configCell(weather: Weather){
        self._weather = weather
        self.day.text = _weather.day
        self.degrees.text = _weather.degrees
        
        self.icon.image = UIImage.init(named: "sunny") //#TODO: see the API
    }

}
