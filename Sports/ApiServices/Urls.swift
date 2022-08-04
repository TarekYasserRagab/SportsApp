//
//  Urls.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//


import Foundation

struct UrlServices {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/\(endPoint)"
    }
}
