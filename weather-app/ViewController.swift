//
//  ViewController.swift
//  weather-app
//
//  Created by R. Maia on 23/09/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //#MARK: @IBOutlets
    @IBOutlet weak var degreesLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    //#MARK: Properties
    fileprivate var weathers: Weathers!
    fileprivate var locManager = CLLocationManager()
    fileprivate var currentLocation: CLLocation!
    fileprivate var isLocationSet = false
    
    //#MARK: Events
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        
        locManager.requestWhenInUseAuthorization()
        setLocation()
        if(isLocationSet) {
            weathers = Weathers(lat: currentLocation.coordinate.latitude, lon: currentLocation.coordinate.longitude)
            weathers.downloadWeathers() {
                //callback
                
                self.degreesLbl.text = self.weathers.list[0].degrees
                self.cityLbl.text = self.weathers.city
                self.icon.image = self.weathers.list[0].icon
                self.detailsLbl.text = "\(DateService.currentDayOfTheWeek!.capitalized) | \(DateService.format(date: Date(), format: "MMM dd")) | \(DateService.format(date: Date(), format: "hh:mm:ss"))"
                
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
        }
    }
    
    //#MARK: TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count - 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableViewCell {
            let weather = weathers.list[indexPath.row + 1]
            cell.configCell(weather: weather)
            
            return cell
        }
        
        return WeatherTableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //#MARK: Functions
    func setLocation() {
        if(CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) {
            
            currentLocation = locManager.location
            isLocationSet = true
        }

    }
    
    func setLayout() {
        if DateService.partOfDay == "morn" || DateService.partOfDay == "day" {
            degreesLbl.textColor = UIColor.black
            cityLbl.textColor = UIColor(netHex: 0x25BACC)
            bg.image = UIImage(named: "sun-bg")
        }else if DateService.partOfDay == "eve" {
            degreesLbl.textColor = UIColor.white
            cityLbl.textColor = UIColor.black
            bg.image = UIImage(named: "moon-bg")
        }else {
            degreesLbl.textColor = UIColor.white
            cityLbl.textColor = UIColor.black
            bg.image = UIImage(named: "night-bg")
            
        }
    }
    
}

