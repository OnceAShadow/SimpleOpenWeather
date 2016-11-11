//  WeatherView.swift
//  SimpleOpenWeatherSwift
//
//  Created by Fred Sevillano on 11/11/16.
//  Copyright © 2016 iOS MAC. All rights reserved.

import UIKit

class WeatherView: UIViewController, WebAPIWorkerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        WebAPIWorker.sharedInstance.delegate = self
        
        WebAPIWorker.sharedInstance.add(urlString: "http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&mode=json&APPID=57ad1e9946cd91926667c610c7200941")
     
        
    }
    
    func updateData(data: Data) {
        print("in there!")
    }
}
