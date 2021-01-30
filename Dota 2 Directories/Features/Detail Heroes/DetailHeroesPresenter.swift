//
//  DetailHeroesPresenter.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 31/01/21.
//

import Foundation
import UIKit

class DetailHeroesPresenter: IDetailHeroesPresenter {weak var view: IDetailHeroesView?
    let viewModel: DetailHeroesViewModel
    
    init(viewModel: DetailHeroesViewModel) {
        self.viewModel = viewModel
    }
    
    func setView(_ view: IDetailHeroesView) {
        self.view = view
    }
    
    func viewWillAppear() {
        
    }
    
    func getImgUrl() -> String {
        return viewModel.detailHeroes.img ?? ""
    }
    
    func getName() -> String {
        return viewModel.detailHeroes.localizedName ?? ""
    }
    
    func getAttackType() -> AttackType {
        return viewModel.detailHeroes.attackType ?? .melee
    }
    
    func getAttr() -> PrimaryAttributes {
        return viewModel.detailHeroes.primaryAttr ?? .str
    }
    
    func getBaseHealth() -> String {
        return "\(viewModel.detailHeroes.baseHealth ?? 0) ( +\(viewModel.detailHeroes.baseHealthRegen ?? 0) )"
    }
    
    func getAttack() -> String {
        return "\(viewModel.detailHeroes.baseAttackMin ?? 0) - \(viewModel.detailHeroes.baseAttackMax ?? 0)"
    }
    
    func getMovSpeed() -> String {
        return "\(viewModel.detailHeroes.moveSpeed ?? 0)"
    }
    
    func getRoles() -> String {
        let roles = viewModel.detailHeroes.roles ?? []
        return roles.joined(separator: ", ")
    }
}
