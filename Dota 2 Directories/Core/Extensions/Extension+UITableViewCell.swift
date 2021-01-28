//
//  Extension+UITableViewCell.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var defaultIdentifier: String {
        return String(describing: self)
    }
    
    static var defaultNib: UINib {
        return UINib(nibName: defaultIdentifier, bundle: Bundle(for: self))
    }
}
