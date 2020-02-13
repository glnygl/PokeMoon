//
//  PokeTypeController.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 9.02.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

protocol PokeTypeDisplayLogic {}

class PokeTypeController: UIViewController, PokeTypeDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!{
    didSet {
        tableView.dataSource = self
        }
    }
    
    var interactor: (PokeTypeBusinessLogic & PokeTypeDataStore)?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setup() {
        let viewController = self
        let interactor = PokeTypeInteractor()
        let presenter = PokeTypePresenter()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.controller = viewController
    }

}

extension PokeTypeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.type?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PokeTypeTableCell", for: indexPath) as? PokeTypeTableCell {
            if let type = interactor?.type?[indexPath.row]{
              cell.typeLabel.text = type
            }
           return cell
        }
           return UITableViewCell()
    }
        
}

