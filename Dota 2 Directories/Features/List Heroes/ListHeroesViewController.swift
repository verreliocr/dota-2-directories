//
//  ListHeroesViewController.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 29/01/21.
//

import UIKit

class ListHeroesViewController: UIViewController {
    
    let presenter: IListHeroesPresenter
    @IBOutlet weak var heroesListCollectionView: UICollectionView!
    
    init(presenter: IListHeroesPresenter) {
        self.presenter = presenter
        super.init(nibName: "ListHeroesViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dota 2 Heroes"
    }

}

extension ListHeroesViewController: IListHeroesView {
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void)) {
        switch type {
        case .noConnection:
            showOfflineAlert(retryAction: {
                retryAction()
            })
        case .serverError:
            showMaintenanceAlert(retryAction: {
                retryAction()
            })
        }
    }
    
    func showLoading(_ show: Bool) {
        
    }
    
    func reloadView() {
        
    }
}
