//
//  DetailHeroesViewController.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 31/01/21.
//

import UIKit

class DetailHeroesViewController: UIViewController {
    
    let presenter: IDetailHeroesPresenter
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var attackTypeLabel: UILabel!
    @IBOutlet weak var attrLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var movSpdLabel: UILabel!
    @IBOutlet weak var rolesLabel: UILabel!
    
    init(presenter: IDetailHeroesPresenter) {
        self.presenter = presenter
        super.init(nibName: "DetailHeroesViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }

}

extension DetailHeroesViewController: IDetailHeroesView {
    func reloadView() {
        let url = "\(baseURL)\(presenter.getImgUrl())"
        heroImageView.setImage(url: url, placeholder: nil)
        heroNameLabel.text = presenter.getName()
        attackTypeLabel.text = "Attack Type : " + presenter.getAttackType().rawValue
        attrLabel.text = "Primary Attribute : " + presenter.getAttr().toString
        healthLabel.text = "Base Health : " + presenter.getBaseHealth()
        attackLabel.text = "Base Attack : " + presenter.getAttack()
        movSpdLabel.text = "Move Speed : " + presenter.getMovSpeed()
        rolesLabel.text = presenter.getRoles()
    }
}
