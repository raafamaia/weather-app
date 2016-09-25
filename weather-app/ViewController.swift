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
        locManager.requestWhenInUseAuthorization()
        setLocation()
        if(isLocationSet) {
            weathers = Weathers(lat: currentLocation.coordinate.latitude, lon: currentLocation.coordinate.longitude)
            weathers.downloadWeathers() {
                //callback
                
                self.tableView.delegate = self
                self.tableView.dataSource = self
            }
        }
        
        
    }
    
    //#MARK: TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableViewCell {
            let weather = weathers.list[indexPath.row]
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
    
}

