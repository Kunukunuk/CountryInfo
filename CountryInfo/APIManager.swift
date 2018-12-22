//
//  APIManager.swift
//  CountryInfo
//
//  Created by Kun Huang on 12/21/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class APIManager {
    
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getAllCountry(completion: @escaping ([CountryData]?, Error?) -> ()) {
        
        var countryArray: [CountryData] = []
        
        let urlString = "https://restcountries.eu/rest/v2/all"
        
        guard let url = URL(string: urlString) else {
            print("no url")
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                
                guard let dataJson = data else {
                    print("bad data")
                    completion(nil, error)
                    return
                }
                let dataDictionary = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! NSArray
                
                for each in dataDictionary {
                    let eachCountry = each as! [String: Any]
                    let country = CountryData(countryDict: eachCountry)
                    countryArray.append(country)
                }
                
                completion(countryArray, nil)
            } else {
                print(error?.localizedDescription ?? "default error??")
            }
        }
        task.resume()
    }
        /*let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                
                guard let dataJson = data else {
                    print("bad data")
                    return
                }
                let dataDictionary = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! NSArray
                
                for each in dataDictionary {
                    let eachCountry = each as! [String: Any]
                    let country = CountryData(countryDict: eachCountry)
                    countryArray.append(country)
                }
            } else {
                print(error?.localizedDescription ?? "default error??")
            }
        }
        task.resume()
    }*/
}
