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
}
