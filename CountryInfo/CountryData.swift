//
//  CountryData.swift
//  CountryInfo
//
//  Created by Kun Huang on 12/21/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class CountryData {
    
    var alpha2Code: String?
    var alpha3Code: String?
    var areaCode: Int?
    var borderCountriesCode: NSArray?
    var callingCodes: NSArray?
    var captial: String?
    var cioc: String?
    var demonym: String?
    var flagURLString: String?
    var gini: String?
    var languages: NSArray?
    var coordinates: NSArray?
    var name: String?
    var population: Int?
    var region: String?
    var subregion: String?
    var timezones: NSArray?
    
    init(countryDict: [String: Any]) {
        alpha2Code = countryDict["alpha2Code"] as? String ?? "No alpha2Code"
        alpha3Code = countryDict["alpha3Code"] as? String ?? "No alpha3Code"
        areaCode = countryDict["area"] as? Int ?? 0
        borderCountriesCode = countryDict["borders"] as? NSArray ?? []
        callingCodes = countryDict["callingCodes"] as? NSArray ?? []
        captial = countryDict["capital"] as? String ?? "No capital"
        cioc = countryDict["cioc"] as? String ?? "No cioc"
        demonym = countryDict["demonym"] as? String ?? "No demonym"
        flagURLString = countryDict["flag"] as? String ?? "No flag"
        gini = countryDict["gini"] as? String ?? "No gini"
        languages = countryDict["languages"] as? NSArray ?? []
        coordinates = countryDict["latlng"] as? NSArray ?? []
        name = countryDict["name"] as? String ?? "No Name"
        population = countryDict["population"] as? Int ?? 0
        region = countryDict["region"] as? String ?? "No region"
        subregion = countryDict["subregion"] as? String ?? "No Subregion"
        timezones = countryDict["timezones"] as? NSArray ?? []
        
    }
    
}
