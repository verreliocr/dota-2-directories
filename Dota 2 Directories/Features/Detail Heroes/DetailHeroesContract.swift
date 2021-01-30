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
    func viewWillAppear()
    func getImgUrl() -> String
    func getName() -> String
    func getAttackType() -> AttackType
    func getAttr() -> PrimaryAttributes
    func getBaseHealth() -> String
    func getAttack() -> String
    func getMovSpeed() -> String
    func getRoles() -> String
}
