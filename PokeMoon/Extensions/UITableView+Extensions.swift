//
//  UITableView+Extensions.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
   
    func register(types : [CellType]) {
        types.forEach { (type) in
            let nib = UINib(nibName: type.rawValue, bundle: nil)
            self.register(nib, forCellReuseIdentifier: type.rawValue)
        }
    }
    
    func dequeue<T : UITableViewCell>(type : String, indexPath : IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type, for: indexPath) as! T
    }
    
}
