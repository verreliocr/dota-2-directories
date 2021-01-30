//
//  DetailHeroesModule.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 31/01/21.
//

import Foundation
import UIKit

class DetailHeroesModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let viewModel = DetailHeroesViewModel(detail: params["detail"] as! HeroesModel,
                                              recommendation: params["recommendation"] as! [HeroesModel])
        let presenter = DetailHeroesPresenter(viewModel: viewModel)
        let view = DetailHeroesViewController(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
