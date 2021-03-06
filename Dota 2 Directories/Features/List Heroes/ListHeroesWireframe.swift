//
//  ListHeroesWireframe.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 29/01/21.
//

import Foundation

class ListHeroesWireframe: IListHeroesWireframe {
    let appRouter: IRouter
    
    init(appRouter: IRouter) {
        self.appRouter = appRouter
    }
    
    func openFilterRoles(delegate: IFilterRolesDelegate, roles: [String], selectedRoles: String) {
        appRouter.presentOver(module: .filterHeroes,
                              using: ["delegate": delegate,
                                      "roles": roles,
                                      "selectedRoles": selectedRoles])
    }
    
    func navigateToDetail(with heroes: HeroesModel, and recommendation: [HeroesModel]) {
        appRouter.push(module: .detailHeroes, using: ["detail": heroes,
                                                      "recommendation": recommendation])
    }
}
