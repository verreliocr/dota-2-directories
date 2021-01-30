//
//  FeatureModule.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation
import UIKit

enum FeatureModule {
    case listHeroes
    case filterHeroes
    case detailHeroes

    func create(using router: IRouter) -> IModule {
        switch self {
        case .listHeroes:
            return ListHeroesModule(appRouter: router)
        case .filterHeroes:
            return FilterRolesModule(appRouter: router)
        case .detailHeroes:
            return DetailHeroesModule(appRouter: router)
        }
    }
}
