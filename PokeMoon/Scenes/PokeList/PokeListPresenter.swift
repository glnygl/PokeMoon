//
//  PokeListPresenter.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

protocol PokeListPresentationLogic {
    func presentPokemons(response: PokeListScene.Fetch.Response)
    func presentPokemon()
}

final class PokeListPresenter: PokeListPresentationLogic {
    
    weak var viewController: PokeListDisplayLogic?
    
    func presentPokemons(response: PokeListScene.Fetch.Response) {
        viewController?.displayPokemons(viewModel: .init(data: response.data))
    }
    
    func presentPokemon() {
        viewController?.displayPokemon()
    }
    
}
