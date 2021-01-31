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
    
    func viewLoaded() {
        self.view?.reloadView()
    }
    
    func getImgUrl() -> String {
        let url = "\(baseURL)\(viewModel.detailHeroes.img ?? "")"
        return url
    }
    
    func getName() -> String {
        return viewModel.detailHeroes.localizedName ?? ""
    }
    
    private func getAttackType() -> AttackType {
        return viewModel.detailHeroes.attackType ?? .melee
    }
    
    private func getRoles() -> String {
        let roles = viewModel.detailHeroes.roles ?? []
        return roles.joined(separator: " - ")
    }
    
    func getAttackRoles() -> NSAttributedString {
        let attrStr = NSMutableAttributedString(string: "\(getAttackType().rawValue) - \(getRoles())",
                                                attributes: [
                                                    .font: UIFont.systemFont(ofSize: 20,
                                                                             weight: .medium),
                                                    .foregroundColor: UIColor.black
                                                ])
        attrStr.addAttributes([.font: UIFont.systemFont(ofSize: 20,
                                                        weight: .semibold)],
                              range: NSRange(location: 0,
                                             length: getAttackType().rawValue.count))

        
        return attrStr
    }
    
    func getAttr() -> String {
        let attribute = viewModel.detailHeroes.primaryAttr?.toString ?? ""
        return "Primary Attribute : " + attribute
    }
    
    func getBaseHealth() -> String {
        let baseHealth = "\(viewModel.detailHeroes.baseHealth ?? 0) ( +\(viewModel.detailHeroes.baseHealthRegen ?? 0) )"
        return "Base Health : " + baseHealth
    }
    
    func getAttack() -> String {
        let baseAttack = "\(viewModel.detailHeroes.baseAttackMin ?? 0) - \(viewModel.detailHeroes.baseAttackMax ?? 0)"
        return "Base Attack : " + baseAttack
    }
    
    func getMovSpeed() -> String {
        let moveSpeed = viewModel.detailHeroes.moveSpeed ?? 0
        return "Move Speed : \(moveSpeed)"
    }
    
    func getImgUrlRecommend(at index: Int) -> String {
        let url = "\(baseURL)\(viewModel.recommendation[index].img ?? "")"
        return url
    }
    
    func getNameRecommend(at index: Int) -> String {
        return viewModel.recommendation[index].localizedName ?? ""
    }
    
    private func getAttackType(at index: Int) -> AttackType {
        return viewModel.recommendation[index].attackType ?? .melee
    }
    
    private func getRoles(at index: Int) -> String {
        let roles = viewModel.recommendation[index].roles ?? []
        return roles.joined(separator: " - ")
    }
    
    func getAttackRolesRecommend(at index: Int) -> NSAttributedString {
        let attrStr = NSMutableAttributedString(string: "\(getAttackType(at: index).rawValue) - \(getRoles(at: index))",
                                                attributes: [
                                                    .font: UIFont.systemFont(ofSize: 18,
                                                                             weight: .medium),
                                                    .foregroundColor: UIColor.black
                                                ])
        attrStr.addAttributes([.font: UIFont.systemFont(ofSize: 18,
                                                        weight: .semibold)],
                              range: NSRange(location: 0,
                                             length: getAttackType(at: index).rawValue.count))

        
        return attrStr
    }
    
    func getTitle(for section: Int) -> String {
        if section == 1 {
            return "Similar Heroes"
        }
        return ""
    }
}
