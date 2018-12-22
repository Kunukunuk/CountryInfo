//
//  CountryCell.swift
//  CountryInfo
//
//  Created by Kun Huang on 12/21/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var subregionLabel: UILabel!
    
    var country: CountryData? {
        didSet {
            let url = URL(string: (country?.flagURLString)!)
            if let data = try? Data(contentsOf: url!)
            {
                self.flagImageView.image = UIImage(data: data)
            }
            countryNameLabel.text = country?.name
            regionLabel.text = country?.region
            subregionLabel.text = country?.subregion
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
