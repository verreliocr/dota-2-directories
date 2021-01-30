//
//  Extension+UIImage.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 30/01/21.
//

import Foundation
import UIKit

extension UIImage {
    func makeTintImage() -> UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
}
