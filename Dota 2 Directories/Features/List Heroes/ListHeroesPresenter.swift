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
        self.viewModel.listHeroes = interactor.fetchHeroes()
        self.view?.reloadView()
        
        getListHeroes()
    }
    
    private func getListHeroes() {
        interactor.getListHeroes { [weak self] data, type in
            if let data = data {
                self?.viewModel.listHeroes = data
                self?.interactor.saveHeroes(data)
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
        var listRoles = Array(Set(listRolesReduce))
        listRoles.insert("All", at: 0)
        
        self.viewModel.listRoles = listRoles
    }
    
    private func getItems() -> [HeroesModel] {
        if viewModel.selectedRoles == "All" {
            return viewModel.listHeroes
        }
        return viewModel.listHeroes.filter({ $0.roles?.contains(viewModel.selectedRoles) ?? false })
    }
    
    func getNumberOfItems() -> Int {
        return getItems().count
    }
    
    func getSelectedRoles() -> String {
        return viewModel.selectedRoles
    }
    
    func getImgUrl(at index: Int) -> String {
        return getItems()[index].img ?? ""
    }
    
    func getName(at index: Int) -> String {
        return getItems()[index].localizedName ?? ""
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
    
    func openFilterRoles() {
        self.wireframe.openFilterRoles(delegate: self, roles: viewModel.listRoles, selectedRoles: viewModel.selectedRoles)
    }
    
    func getRecommendation(primaryAttr: PrimaryAttributes) {
        switch primaryAttr {
        case .str:
            self.viewModel.recommendation = getHighestMaxAttack()
        case .agi:
            self.viewModel.recommendation = getHighestSpeed()
        case .int:
            self.viewModel.recommendation =  getHighestMana()
        }
    }
    
    func didSelectHeroes(at index: Int) {
        let selectedHeroes = getItems()[index]
        getRecommendation(primaryAttr: selectedHeroes.primaryAttr ?? .str)
        
        wireframe.navigateToDetail(with: selectedHeroes, and: self.viewModel.recommendation)
    }
}

extension ListHeroesPresenter: IFilterRolesDelegate {
    func didFinishSelectRoles(_ roles: String) {
        self.viewModel.selectedRoles = roles
        self.view?.reloadView()
    }
}
