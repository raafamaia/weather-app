//
//  ViewController.swift
//  weather-app
//
//  Created by R. Maia on 23/09/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //#MARK: @IBOutlets
    @IBOutlet weak var degreesLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    //#MARK: @IBOutlets
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return WeatherTableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    



}

