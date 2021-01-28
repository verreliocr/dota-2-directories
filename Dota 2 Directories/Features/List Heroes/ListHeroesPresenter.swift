//
//  ListHeroesPresenter.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 29/01/21.
//

import Foundation
import UIKit

class ListHeroesPresenter: IListHeroesPresenter {
    weak var view: IListHeroesView?
    let viewModel: ListHeroesViewModel
    let interactor: IListHeroesInteractor
    let wireframe: IListHeroesWireframe
    
    init(viewModel: ListHeroesViewModel, interactor: IListHeroesInteractor, wireframe: IListHeroesWireframe) {
        self.viewModel = viewModel
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func setView(_ view: IListHeroesView) {
        self.view = view
    }
    
    func viewWillAppear() {
        getListHeroes()
    }
    
    private func getListHeroes() {
        view?.showLoading(true)
        interactor.getListHeroes { [weak self] data, type in
            self?.view?.showLoading(false)
            if let data = data {
                self?.viewModel.listHeroes = data
                self?.view?.reloadView()
            }
            if let type = type {
                self?.view?.handleError(type: type, retryAction: { [weak self] in
                    self?.getListHeroes()
                })
            }
        }
    }
    
    func getNumberOfItems() -> Int {
        return viewModel.listHeroes.count
    }
}
