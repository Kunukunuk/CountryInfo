//
//  ViewController.swift
//  CountryInfo
//
//  Created by Kun Huang on 12/21/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var countryInfo: [CountryData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        APIData()
    }
    
    func APIData() {
        
        let urlString = "https://restcountries.eu/rest/v2/all"
        
        guard let url = URL(string: urlString) else {
            print("no url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                
                guard let dataJson = data else {
                    print("bad data")
                    return
                }
                let dataDictionary = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! NSArray
                
                for each in dataDictionary {
                    let eachCountry = each as! [String: Any]
                    let country = CountryData(countryDict: eachCountry)
                    self.countryInfo.append(country)
                }
            } else {
                print(error?.localizedDescription ?? "default error??")
            }
        }
        task.resume()
    }


}

