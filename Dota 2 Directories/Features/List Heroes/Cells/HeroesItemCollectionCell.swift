//
//  HeroesItemCollectionCell.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 29/01/21.
//

import UIKit

class HeroesItemCollectionCell: UICollectionViewCell {

    @IBOutlet weak var placeholderView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var heroesImageView: UIImageView!
    @IBOutlet weak var heroesNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadingIndicator.startAnimating()
    }
    
    func bind(imgUrl: String, name: String) {
        self.heroesImageView.isHidden = true
        self.placeholderView.isHidden = false
        heroesImageView.setImage(url: "\(baseURL)\(imgUrl)", placeholder: nil) { [unowned self] _ in
            self.heroesImageView.isHidden = false
            self.placeholderView.isHidden = true
        }
        heroesNameLabel.text = name
    }

}
