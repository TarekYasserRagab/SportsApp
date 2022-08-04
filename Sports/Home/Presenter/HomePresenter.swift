//
//  HomePresenter.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//

import Foundation

protocol HomePresenter {
    func fetchData(endPoint: String)
    func onSuccess(sports: [Sport])
    func onFail(error: Error)
}

protocol HomeView {
    func postSuccessHomeView(sports: [Sport])
    func postErrorHomeView(error: Error)
}

class HomePresenterImplemntation : HomePresenter {
    let view: HomeView
    
    init(view : HomeView) {
        self.view = view
    }
    
    func onSuccess(sports: [Sport]) {
        view.postSuccessHomeView(sports: sports)
    }
    
    func fetchData(endPoint: String) {
                let ModelController = HomeModelController(HomePresenter: self)
                ModelController.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onFail(error: Error) {
        view.postErrorHomeView(error: error)
    }
}

