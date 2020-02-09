//
//  PokeDetailPresenter.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation


protocol PokeDetailPresentationLogic {
    func presentPokemon(response: PokeDetailScene.Show.Response)
}

final class PokeDetailPresenter: PokeDetailPresentationLogic {
      
    var controller: PokeDetailDisplayLogic?
    
    func presentPokemon(response: PokeDetailScene.Show.Response) {
        controller?.displayPokemon(viewModel: PokeDetailScene.Show.ViewModel(data: response.data))
    }
    
}
