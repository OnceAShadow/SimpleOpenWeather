//  WebAPIWorker.swift
//  SimpleOpenWeatherSwift
//
//  Created by Fred Sevillano on 11/11/16.
//  Copyright © 2016 iOS MAC. All rights reserved.

import UIKit

protocol WebAPIWorkerDelegate: class {
    func updateData(data: Data)
}

class WebAPIWorker: NSObject {

    weak var delegate:WebAPIWorkerDelegate?
    
    func add(urlString: String) {
        
        
    }
    
    // Singleton!
    static let sharedInstance = WebAPIWorker()
    private override init() {}
}
