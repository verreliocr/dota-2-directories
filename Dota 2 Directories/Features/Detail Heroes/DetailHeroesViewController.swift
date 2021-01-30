//
//  DetailHeroesViewController.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 31/01/21.
//

import UIKit

class DetailHeroesViewController: UIViewController {
    
    let presenter: IDetailHeroesPresenter
    
    init(presenter: IDetailHeroesPresenter) {
        self.presenter = presenter
        super.init(nibName: "DetailHeroesViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension DetailHeroesViewController: IDetailHeroesView {
    func reloadView() {
        
    }
}
