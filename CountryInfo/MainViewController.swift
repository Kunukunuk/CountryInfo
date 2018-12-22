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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
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

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        
        return cell
    }
    
    
}

