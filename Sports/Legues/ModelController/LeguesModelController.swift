//
//  LeguesModelController.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//

import Foundation

protocol LeaguesModel {
    func fetchDataFromApi(endPoint: String)
}

class LeaguesModelController: LeaguesModel {
    
    let apiService: ApiService = NetworkManager()
    let LeguesPresenter: LeguesPresenter
    
    init(LeguesPresenter: LeguesPresenter)  {
        self.LeguesPresenter = LeguesPresenter
    }
    
    func fetchDataFromApi(endPoint: String) {
        apiService.fetchLegues(endPoint: endPoint) { leagues, error in
                    if let leagues = leagues {
                        self.LeguesPresenter.onSuccess(leagues: leagues)
                    }
                    if let error = error {
                        self.LeguesPresenter.onFail(error: error)
                    }
                }
    }
}
