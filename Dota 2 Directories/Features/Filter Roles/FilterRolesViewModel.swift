//
//  FilterRolesViewModel.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 30/01/21.
//

import Foundation

class FilterRolesViewModel {
    var roles: [String] = []
    var selectedRoles: String = ""
    
    init(roles: [String], selectedRoles: String) {
        self.roles = roles
        self.selectedRoles = selectedRoles
    }
}
