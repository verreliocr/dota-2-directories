//
//  RecommendationTableCell.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 31/01/21.
//

import UIKit

class RecommendationTableCell: UITableViewCell {

    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var attackRolesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func bind(imgUrl: String, name: String, attackRoles: NSAttributedString) {
        heroImageView.setImage(url: imgUrl, placeholder: nil)
        heroNameLabel.text = name
        attackRolesLabel.attributedText = attackRoles
    }
    
}
