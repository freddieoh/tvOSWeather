//
//  ViewController.swift
//  tvOSWeather
//
//  Created by Fredrick Ohen on 11/21/16.
//  Copyright © 2016 geeoku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentSummary: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = NSURL(string: "https://api.forecast.io/forecast/d3250bf407f0579c8355cd39cdd4f9e1/37.7833,122.4167") {
        if let data = NSData(contentsOf: url as URL) {
        
        do {
            let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
            let newDict = parsed["currently"] as! [String:Any]
            self.currentTemp.text = "\(newDict["temperature"]!)"
            self.currentSummary.text = "\(newDict["summary"]!)"
        }
        catch let error as NSError {
            print("A JSON parsing error occurred, here are the details:\n \(error)")  }
    
    }
        }
    }


}

