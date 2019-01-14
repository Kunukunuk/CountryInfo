//
//  CountryViewController.swift
//  CountryInfo
//
//  Created by Kun Huang on 1/4/19.
//  Copyright © 2019 Kun Huang. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {

    var country: CountryData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(country?.name)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
