//
//  HomeModelController.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//

import Foundation

protocol HomeModel {
    func fetchDataFromApi(endPoint: String)
}

class HomeModelController: HomeModel {
    
    let apiService: ApiService = NetworkManager()
    let HomePresenter: HomePresenter
    
    init(HomePresenter: HomePresenter)  {
        self.HomePresenter = HomePresenter
    }
    
    func fetchDataFromApi(endPoint: String) {
        apiService.fetchSports(endPoint: endPoint) { spotrs, error in
                    if let sports = spotrs {
                        self.HomePresenter.onSuccess(sports: sports)
                    }
                    if let error = error {
                        self.HomePresenter.onFail(error: error)
                    }
                }
    }
}

