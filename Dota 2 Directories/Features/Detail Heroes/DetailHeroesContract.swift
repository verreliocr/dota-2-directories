//
//  DetailHeroesContract.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 30/01/21.
//

import Foundation
import UIKit

protocol IDetailHeroesView: class {
    func reloadView()
}

protocol IDetailHeroesPresenter {
    func setView(_ view: IDetailHeroesView)
    func viewLoaded()
    func getImgUrl() -> String
    func getName() -> String
    func getAttackRoles() -> NSAttributedString
    func getAttr() -> String
    func getBaseHealth() -> String
    func getAttack() -> String
    func getMovSpeed() -> String
    func getImgUrlRecommend(at index: Int) -> String
    func getNameRecommend(at index: Int) -> String
    func getAttackRolesRecommend(at index: Int) -> NSAttributedString
    func getTitle(for section: Int) -> String
}
