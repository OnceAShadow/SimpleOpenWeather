//  WebAPIWorker.swift
//  SimpleOpenWeatherSwift
//
//  Created by Fred Sevillano on 11/11/16.
//  Copyright © 2016 iOS MAC. All rights reserved.

import UIKit

protocol WebAPIWorkerDelegate: class {
    func updateData(data: NSDictionary)
}

class WebAPIWorker: NSObject {

    weak var delegate:WebAPIWorkerDelegate?
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func getURLData(urlString: String) {
        
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        let url = URL(string: urlString)
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            self.dataTask = self.defaultSession.dataTask(with: url!, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
        
                if let error = error {
                    print(error.localizedDescription)
                } else if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        
                        do{
                            let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:AnyObject]
                            
                            DispatchQueue.main.async {
                                self.delegate?.updateData(data: jsonData as NSDictionary)
                            }
                            
                        }catch{
                            print("JSON Error: \(error.localizedDescription)")
                        }
                    }
                }
            })
            self.dataTask?.resume()
        }
    }
    
    static let sharedInstance = WebAPIWorker()
    private override init() {}
}
