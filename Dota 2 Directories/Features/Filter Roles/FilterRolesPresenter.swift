//
//  FilterRolesPresenter.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 30/01/21.
//

import Foundation

class FilterRolesPresenter: IFilterRolesPresenter {
    weak var view: IFilterRolesView?
    let viewModel: FilterRolesViewModel
    weak var delegate: IFilterRolesDelegate?
    
    init(viewModel: FilterRolesViewModel) {
        self.viewModel = viewModel
    }
    
    func setView(_ view: IFilterRolesView) {
        self.view = view
    }
    
    func viewWillAppear() {
        self.view?.reloadView()
    }
    
    func getNumberOfItems() -> Int {
        return viewModel.roles.count
    }
    
    func getSelectedRoles() -> Int {
        if let indexPosition = viewModel.roles.firstIndex(of: viewModel.selectedRoles) {
            return indexPosition
        }
        return 0
    }
    
    func getRoles(at index: Int) -> String {
        return viewModel.roles[index]
    }
    
    func didSelectRoles(at index: Int) {
        self.viewModel.selectedRoles = viewModel.roles[index]
    }
    
    func didFinishSelectRoles() {
        self.delegate?.didFinishSelectRoles(self.viewModel.selectedRoles)
    }
    
}
