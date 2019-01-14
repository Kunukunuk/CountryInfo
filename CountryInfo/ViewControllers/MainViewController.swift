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
        
        APIManager().getAllCountry { (countryArray, error) in
            
            if error == nil {
                self.countryInfo = countryArray!
                print(self.countryInfo.count)
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription ?? "Default error?")
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let destinationVC = segue.destination as! CountryViewController
            let index = tableView.indexPathForSelectedRow!
            destinationVC.country = countryInfo[index.row]
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        
        cell.country = countryInfo[indexPath.row]
        
        return cell
    }
    
}

