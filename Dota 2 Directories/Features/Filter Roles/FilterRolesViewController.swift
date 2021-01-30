//
//  FilterRolesViewController.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 30/01/21.
//

import UIKit

class FilterRolesViewController: UIViewController {
    
    let presenter: IFilterRolesPresenter
    @IBOutlet weak var rolesPickerView: UIPickerView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    init(presenter: IFilterRolesPresenter) {
        self.presenter = presenter
        super.init(nibName: "FilterRolesViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickerView()
        
        cancelButton.addAction { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
        
        doneButton.addAction { [unowned self] in
            self.dismiss(animated: true, completion: {
                self.presenter.didFinishSelectRoles()
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }
    
    private func setupPickerView() {
        rolesPickerView.delegate = self
        rolesPickerView.dataSource = self
    }

}

extension FilterRolesViewController: IFilterRolesView {
    func reloadView() {
        rolesPickerView.reloadAllComponents()
        rolesPickerView.selectRow(self.presenter.getSelectedRoles(), inComponent: 0, animated: false)
    }
}

extension FilterRolesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.presenter.getNumberOfItems()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.presenter.getRoles(at: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.presenter.didSelectRoles(at: row)
    }
}
