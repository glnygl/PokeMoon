//
//  PokeDetailInteractor.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

protocol PokeDetailBusinessLogic {
    func showPokemon()
}

protocol PokeDetailDataStore {
    var pokemon: Pokemon? { get set }
}

final class PokeDetailInteractor: PokeDetailBusinessLogic, PokeDetailDataStore {
    var pokemon: Pokemon?
    
    var presenter: PokeDetailPresentationLogic?
    var worker: PokeDetailWorkingLogic?
    
    func showPokemon() {
        if let pokemon = pokemon{
            presenter?.presentPokemon(response: PokeDetailScene.Show.Response(data: pokemon))
        }
    }

    
}
