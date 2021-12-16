//
//  Universities.swift
//  UKUniDomain
//
//  Created by Suman Gurung on 15/12/2021.
//

import Foundation

struct Universities: Decodable {
    var stateProvince:String?
    var country:String
    var webPages:[String]
    var name:String
    var alphaTwoCode:String
    var domains:String
    
    enum CodingKeys:String, CodingKey {
        case stateProvince = "state-province"
        case country, name, domains
        case webPages = "web_pages"
        case alphaTwoCode = "apha_two_code"
    }
}
