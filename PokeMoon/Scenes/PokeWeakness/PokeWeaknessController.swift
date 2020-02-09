//
//  PokeWeaknessController.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 9.02.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

class PokeWeaknessController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
    didSet {
        tableView.dataSource = self
    }
    }
    
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
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PokeWeaknessController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokeWeaknessCell", for: indexPath)
           return cell
    }
    
    
}
