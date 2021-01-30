//
//  FilterRolesContract.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 30/01/21.
//

import Foundation
import UIKit

protocol IFilterRolesDelegate: class {
    func didFinishSelectRoles(_ roles: String)
}

protocol IFilterRolesView: class {
    func reloadView()
}

protocol IFilterRolesPresenter {
    func setView(_ view: IFilterRolesView)
    func viewWillAppear()
    func getNumberOfItems() -> Int
    func getSelectedRoles() -> Int
    func getRoles(at index: Int) -> String
    func didSelectRoles(at index: Int)
    func didFinishSelectRoles()
}
