//
//  Extension+UIImageView.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func setImage(url: String, placeholder: UIImage?, completion: ((Error?) -> Void)? = nil) {
        guard let newUrl = URL(string: url) else { return }
        SDWebImageCodersManager.sharedInstance().addCoder(SDWebImageGIFCoder.shared())
        sd_setImage(with: newUrl, placeholderImage: placeholder, options: []) { (_, error, _, _) in
            completion?(error)
        }
    }
}
