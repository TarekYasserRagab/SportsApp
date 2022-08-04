//
//  ApiServices.swift
//  Demo
//
//  Created by Yasmin Mohsen on 18/06/2022.
//

import Foundation

protocol ApiService {
    func fetchSports(endPoint: String, completion: @escaping (([Sport]?, Error?) -> Void))
    func fetchLegues(endPoint: String, completion: @escaping (([League]?, Error?) -> Void))
    func fetchEventes(endPoint: String, completion: @escaping (([Eventes]?, Error?) -> Void))
    func fetchTeams(endPoint: String, completion: @escaping (([Teams]?, Error?) -> Void))
}
