//
//  ListHeroesModule.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 29/01/21.
//

import Foundation
import UIKit

class ListHeroesModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let viewModel = ListHeroesViewModel()
        let interactor = ListHeroesInteractor(request: HTTPRequest())
        let wireframe = ListHeroesWireframe(appRouter: router)
        let presenter = ListHeroesPresenter(viewModel: viewModel, interactor: interactor, wireframe: wireframe)
        let view = ListHeroesViewController(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
