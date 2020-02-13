//
//  PokeWeaknesInteractor.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 9.02.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

protocol PokeWeaknesBusinessLogic {}
protocol PokeWeaknesDataSource {
    var weakness: [String]? {get set}
}

final class PokeWeaknesInteractor: PokeWeaknesBusinessLogic, PokeWeaknesDataSource {
    var weakness: [String]?
    
    var presenter: PokeWeaknessPresentationLogic?
    
}
