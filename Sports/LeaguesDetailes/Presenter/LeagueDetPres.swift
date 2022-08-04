//
//  LeagueDetPres.swift
//  Sports
//
//  Created by Tarek on 21/06/2022.
//

import Foundation

protocol EventesPresenter {
    func fetchData(endPoint: String)
    func onSuccess(eventes: [Eventes])
    func onSuccess(teams: [Teams])
    func onFail(error: Error)
}

protocol EventesView {
    func postSuccessEventesView(eventes: [Eventes])
    func postSuccessTeamsView(teams: [Teams])
    func postErrorEventesView(error: Error)
}

class EventesPresenterImplemntation : EventesPresenter {
    
    let view: EventesView
    
    init(view : EventesView) {
        self.view = view
    }
    
    func onSuccess(eventes: [Eventes]) {
        view.postSuccessEventesView(eventes: eventes)
        
    }
    
    func onSuccess(teams: [Teams]) {
        view.postSuccessTeamsView(teams: teams)
    }
    
    func fetchData(endPoint: String) {
                let ModelController = EventesModelController(EventesPresenter: self)
                let ModelControllerTeams = EventesModelController(EventesPresenter: self)
                ModelController.fetchDataFromApi(endPoint: endPoint)
                ModelControllerTeams.fetchDataFromApiTeams(endPoint: endPoint)
    }
    
    func onFail(error: Error) {
        view.postErrorEventesView(error: error)
    }
}

