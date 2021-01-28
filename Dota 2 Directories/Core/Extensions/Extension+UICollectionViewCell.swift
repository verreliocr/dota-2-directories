//
//  Extension+UICollectionViewCell.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    static var defaultIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: defaultIdentifier, bundle: nil)
    }
}
