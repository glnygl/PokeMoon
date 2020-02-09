//
//  PokeListRouter.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

protocol PokeListRoutingLogic {
    func navigatePokemon()
}

final class PokeListRouter: PokeListRoutingLogic {
    
    weak var viewController: PokeListController?
    
    func navigatePokemon() {
        if let model = viewController?.interactor?.pokemon, let pokeDetailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PokeDetailController") as? PokeDetailController {
            pokeDetailViewController.interactor?.pokemon = model
            viewController?.navigationController?.pushViewController(pokeDetailViewController, animated: true)
        }
    }
    
}
