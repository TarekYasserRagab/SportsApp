//
//  Urls.swift
//  Demo
//
//  Created by Yasmin Mohsen on 18/06/2022.
//

import Foundation

struct UrlServices {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/\(endPoint)"
    }
}
