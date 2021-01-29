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
    @IBOutlet weak var filterButton: UIButton!
    
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
        self.filterButton.setTitle("Filter by roles : \(self.presenter.getSelectedRoles())", for: .normal)
        self.setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter.viewWillAppear()
    }
    
    private func setupCollectionView() {
        heroesListCollectionView.dataSource = self
        heroesListCollectionView.delegate = self
        heroesListCollectionView.register([HeroesItemCollectionCell.self])
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
        DispatchQueue.main.async { [unowned self] in
            self.heroesListCollectionView.reloadData()
        }
    }
}

extension ListHeroesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: HeroesItemCollectionCell = collectionView.dequeueReusableCell(indexPath) {
            cell.bind(imgUrl: presenter.getImgUrl(at: indexPath.item),
                      name: presenter.getName(at: indexPath.item))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 48) / 2
        let height = width / 256 * 184
        return CGSize(width: width, height: height)
    }
}
