//
//  FilterRolesModule.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 30/01/21.
//

import Foundation
import UIKit

class FilterRolesModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let viewModel = FilterRolesViewModel(roles: params["roles"] as! [String],
                                             selectedRoles: params["selectedRoles"] as! String)
        let presenter = FilterRolesPresenter(viewModel: viewModel)
        let view = FilterRolesViewController(presenter: presenter)
        presenter.setView(view)
        presenter.delegate = params["delegate"] as? IFilterRolesDelegate
        return view
    }
}
