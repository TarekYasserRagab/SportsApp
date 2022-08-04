//
//  Model.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//

import Foundation


struct SportModel: Codable {
    let sports: [Sport]
}

struct Sport: Codable {
    let idSport, strSport: String
    let strFormat: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}
