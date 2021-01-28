//
//  Extension+UICollectionView.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func register(_ cells: [UICollectionViewCell.Type]) {
        for cell in cells {
            register(cell.nib, forCellWithReuseIdentifier: cell.defaultIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: T.defaultIdentifier, for: indexPath) as? T
    }
}
