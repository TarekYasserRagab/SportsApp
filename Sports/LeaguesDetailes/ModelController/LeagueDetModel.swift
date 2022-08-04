//
//  LeagueDetModel.swift
//  Sports
//
//  Created by Tarek on 21/06/2022.
//

import Foundation

protocol EventesModel {
    func fetchDataFromApi(endPoint: String)
}

class EventesModelController: EventesModel {
    
    let apiService: ApiService = NetworkManager()
    let EventesPresenter: EventesPresenter
    
    init(EventesPresenter: EventesPresenter)  {
        self.EventesPresenter = EventesPresenter
    }
    
    func fetchDataFromApi(endPoint: String) {
        
        apiService.fetchEventes(endPoint: endPoint) { eventes, error in
            if let eventes = eventes {
                self.EventesPresenter.onSuccess(eventes: eventes)
            }
            if let error = error {
                self.EventesPresenter.onFail(error: error)
            }
}
    }
    func fetchDataFromApiTeams(endPoint: String) {
        
        apiService.fetchTeams(endPoint: endPoint) { teams, error in
            if let teams = teams {
                self.EventesPresenter.onSuccess(teams: teams)
            }
            if let error = error {
                self.EventesPresenter.onFail(error: error)
            }
}
    }
    
}
