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
                self?.getListRoles()
            }
            if let type = type {
                self?.view?.handleError(type: type, retryAction: { [weak self] in
                    self?.getListHeroes()
                })
            }
        }
    }
    
    private func getListRoles() {
        let listRolesRaw = viewModel.listHeroes.map({ $0.roles ?? [] })
        let listRolesReduce = listRolesRaw.reduce([], +)
        let listRoles = Array(Set(listRolesReduce))
        
        self.viewModel.listRoles = listRoles
    }
    
    func getNumberOfItems() -> Int {
        return viewModel.listHeroes.count
    }
    
    func getSelectedRoles() -> String {
        return viewModel.selectedRoles
    }
    
    func getImgUrl(at index: Int) -> String {
        return viewModel.listHeroes[index].img ?? ""
    }
    
    func getName(at index: Int) -> String {
        return viewModel.listHeroes[index].localizedName ?? ""
    }
    
    func getHighestSpeed() -> [HeroesModel] {
        let sorted = viewModel.listHeroes.sorted(by: {
            ($0.moveSpeed ?? 0) > ($1.moveSpeed ?? 0)
        })
        let getPrefix = sorted.prefix(3)
        return Array(getPrefix)
    }
    
    func getHighestMaxAttack() -> [HeroesModel] {
        let sorted = viewModel.listHeroes.sorted(by: {
            ($0.baseAttackMax ?? 0) > ($1.baseAttackMax ?? 0)
        })
        let getPrefix = sorted.prefix(3)
        return Array(getPrefix)
    }
    
    func getHighestMana() -> [HeroesModel] {
        let sorted = viewModel.listHeroes.sorted(by: {
            ($0.baseMana ?? 0) > ($1.baseMana ?? 0)
        })
        let getPrefix = sorted.prefix(3)
        return Array(getPrefix)
    }
}
