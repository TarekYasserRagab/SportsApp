//
//  NetworkManager.swift
//  Demo
//
//  Created by Yasmin Mohsen on 18/06/2022.
//

import Foundation

class NetworkManager: ApiService {
    
    func fetchSports(endPoint: String, completion: @escaping (([Sport]?, Error?) -> Void)) {
        // fetching data
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray: SportModel? = convertFromJson(data: data)
                    completion(decodedArray?.sports,nil)
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }
    }
    
    func fetchLegues(endPoint: String, completion: @escaping (([League]?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray: LeguesModel? = convertFromJson(data: data)
                    completion(decodedArray?.countries,nil)
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }
    }
    
    func fetchEventes(endPoint: String, completion: @escaping (([Eventes]?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray: EventsModel? = convertFromJson(data: data)
                    completion(decodedArray?.events,nil)
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }

    }
    
    func fetchTeams(endPoint: String, completion: @escaping (([Teams]?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray: TeamsModel? = convertFromJson(data: data)
                    completion(decodedArray?.teams,nil)
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }
    }
    
}
