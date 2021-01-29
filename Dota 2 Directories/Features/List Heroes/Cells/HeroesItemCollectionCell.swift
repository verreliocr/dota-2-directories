//
//  HeroesItemCollectionCell.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 29/01/21.
//

import UIKit

class HeroesItemCollectionCell: UICollectionViewCell {

    @IBOutlet weak var heroesImageView: UIImageView!
    @IBOutlet weak var heroesNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(imgUrl: String, name: String) {
        if let url = URL(string: "\(baseURL)\(imgUrl)") {
            heroesImageView.setImage(url: url, placeholder: nil)
        }
        heroesNameLabel.text = name
    }

}
