//
//  PokeWeaknessController.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 9.02.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

protocol PokeWeaknessDisplayLogic {}

class PokeWeaknessController: UIViewController, PokeWeaknessDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!{
    didSet {
        tableView.dataSource = self
    }
    }
    
    var interactor: (PokeWeaknesBusinessLogic & PokeWeaknesDataSource)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }
    
    func setup() {
        let viewController = self
        let interactor = PokeWeaknesInteractor()
        let presenter = PokeWeaknessPresenter()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.controller = viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PokeWeaknessController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.weakness?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PokeWeaknessTableCell", for: indexPath) as? PokeWeaknessTableCell {
            if let weakness = interactor?.weakness?[indexPath.row]{
                cell.weaknessLabel.text = weakness
            }
           return cell
        }
        return UITableViewCell()
    }
    
    
}
