//
//  PokeListInteractor.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

protocol PokeListBusinessLogic {
    func fetchPokemons(request: PokeListScene.Fetch.Request)
    func showPokemon(request: PokeListScene.Show.Request)
}

protocol PokeListDataStore {
    var pokemons: [Pokemon]? { get set }
    var pokemon: Pokemon? { get set }
}

final class PokeListInteractor : PokeListBusinessLogic, PokeListDataStore {
    
    var presenter: PokeListPresentationLogic?
    var worker : PokeListWorkingLogic?
    
    var pokemons: [Pokemon]?
    var pokemon: Pokemon?
    
    func fetchPokemons(request: PokeListScene.Fetch.Request) {
        worker?.fetchPokemons { [weak self] (data) in
            if let pokemons = data {
                self?.pokemons = pokemons
                self?.presenter?.presentPokemons(response: PokeListScene.Fetch.Response(data: pokemons))
            } else {
                
            }
        }
    }
    
    func showPokemon(request: PokeListScene.Show.Request) {
        self.pokemon = pokemons?[request.index]
        presenter?.presentPokemon()
    }
    
    
}
