//
//  TeamsModel.swift
//  Sports
//
//  Created by Tarek on 23/06/2022.
//

import Foundation

struct TeamsModel: Codable {
    let teams: [Teams]
    
}


struct Teams: Codable {
    let strTeamBadge: String?
    let strLeague: String?
    let strStadium: String?
    let strDescriptionEN:String?
    let strTeam: String?
    let intFormedYear: String?
}
