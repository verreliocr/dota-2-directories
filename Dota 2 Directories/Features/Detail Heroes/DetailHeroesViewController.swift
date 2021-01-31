//
//  DetailHeroesViewController.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 31/01/21.
//

import UIKit

class DetailHeroesViewController: UIViewController {
    
    let presenter: IDetailHeroesPresenter
    @IBOutlet weak var detailHeroesTableView: UITableView!
    
    init(presenter: IDetailHeroesPresenter) {
        self.presenter = presenter
        super.init(nibName: "DetailHeroesViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewLoaded()
    }
    
    private func setupTableView() {
        detailHeroesTableView.delegate = self
        detailHeroesTableView.dataSource = self
        detailHeroesTableView.estimatedRowHeight = 200
        detailHeroesTableView.rowHeight = UITableView.automaticDimension
        detailHeroesTableView.register([HeroTableCell.self,
                                        RecommendationTableCell.self])
    }

}

extension DetailHeroesViewController: IDetailHeroesView {
    func reloadView() {
        DispatchQueue.main.async { [unowned self] in
            self.detailHeroesTableView.reloadData()
        }
    }
}

extension DetailHeroesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0, let cell: HeroTableCell = tableView.dequeueReusableCell() {
            cell.bind(imgUrl: presenter.getImgUrl(),
                      name: presenter.getName(),
                      attackRoles: presenter.getAttackRoles(),
                      attributes: presenter.getAttr(),
                      health: presenter.getBaseHealth(),
                      attack: presenter.getBaseHealth(),
                      movSpd: presenter.getMovSpeed())
            return cell
        }
        
        if indexPath.section == 1, let cell: RecommendationTableCell = tableView.dequeueReusableCell() {
            cell.bind(imgUrl: presenter.getImgUrlRecommend(at: indexPath.row),
                      name: presenter.getNameRecommend(at: indexPath.row),
                      attackRoles: presenter.getAttackRolesRecommend(at: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 56
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let viewHeader = UIView(frame: CGRect.zero)
            viewHeader.backgroundColor = .white
            let titleLabel = UILabel(frame: CGRect(x: 32, y: 8, width: UIScreen.main.bounds.width - 64, height: 40))
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
            titleLabel.text = presenter.getTitle(for: section)
            
            viewHeader.addSubview(titleLabel)
            
            return viewHeader
        }
        return nil
    }
}
