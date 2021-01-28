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
    func viewWillAppear()
    func getNumberOfItems() -> Int
}

protocol IListHeroesWireframe {
    
}
