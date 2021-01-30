//
//  IRouter.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation
import UIKit

protocol IRouter: class {
    func setNavigationController(_ nav: UINavigationController)
    func setRoot(to module: FeatureModule, window: UIWindow?, using params: [String: Any])
    func popToRoot()
    func replace(with module: FeatureModule, using params: [String: Any])
    func present(module: FeatureModule, asNavigation: Bool, using params: [String: Any])
    func push(module: FeatureModule, using params: [String: Any])
    func directPresent(_ viewController: UIViewController)
    func presentOver(module: FeatureModule, using params: [String : Any])
}
