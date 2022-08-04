//
//  LeguesPresenter.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//

import Foundation

protocol LeguesPresenter {
    func fetchData(endPoint: String)
    func onSuccess(leagues: [League])
    func onFail(error: Error)
}

protocol LeguesView {
    func postSuccessLeaguesView(leagues: [League])
    func postErrorLeaguesView(error: Error)
}

class LeguesPresenterImplemntation : LeguesPresenter {
    let view: LeguesView
    
    init(view : LeguesView) {
        self.view = view
    }
    
    func onSuccess(leagues: [League]) {
        view.postSuccessLeaguesView(leagues: leagues)
        
    }
    
    func fetchData(endPoint: String) {
                let ModelController = LeaguesModelController(LeguesPresenter: self)
                ModelController.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onFail(error: Error) {
        view.postErrorLeaguesView(error: error)
    }
}


