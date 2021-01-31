//
//  HeroTableCell.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 31/01/21.
//

import UIKit

class HeroTableCell: UITableViewCell {
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var attackRolesLabel: UILabel!
    @IBOutlet weak var attrLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var movSpdLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func bind(imgUrl: String, name: String, attackRoles: NSAttributedString, attributes: String, health: String, attack: String, movSpd: String) {
        heroImageView.setImage(url: imgUrl, placeholder: nil)
        heroNameLabel.text = name
        attackRolesLabel.attributedText = attackRoles
        attrLabel.text = attributes
        healthLabel.text = health
        attackLabel.text = attack
        movSpdLabel.text = movSpd
    }
    
}
