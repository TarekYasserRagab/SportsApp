//
//  LeguesModel.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//

import Foundation

struct LeguesModel: Codable {
    let countries: [League]
    
}

struct League: Codable {
    let idLeague: String?
    let strLeague: String?
    let strSport: String?
    let strLeagueAlternate: String?
    let strBadge: String?
    let strYoutube: String?
}

////"strWebsite": "fshf.org/competition/kategoria-e-pare",
//"strFacebook": "www.facebook.com/FederataShqiptareeFutbollit",
//"strInstagram": null,
//"strTwitter": "twitter.com/FSHForg",
//"strYoutube": "www.youtube.com/channel/UC3Guly6AbOr3PqrZMaV6vog"
