//
//  ListHeroesContract.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 29/01/21.
//

import Foundation
import UIKit

protocol IListHeroesView: class {
    func reloadView()
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void))
    func showLoading(_ show: Bool)
}

protocol IListHeroesInteractor {
    func getListHeroes(completion: @escaping (([HeroesModel]?, ErrorType?) -> Void))
}

protocol IListHeroesPresenter {
    func setView(_ view: IListHeroesView)
    func getSelectedRoles() -> String
    func viewWillAppear()
    func getNumberOfItems() -> Int
    func getImgUrl(at index: Int) -> String
    func getName(at index: Int) -> String
    func getHighestSpeed() -> [HeroesModel]
    func getHighestMaxAttack() -> [HeroesModel]
    func getHighestMana() -> [HeroesModel]
    func openFilterRoles()
}

protocol IListHeroesWireframe {
    func openFilterRoles(delegate: IFilterRolesDelegate, roles: [String], selectedRoles: String)
}
