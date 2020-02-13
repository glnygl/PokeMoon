//
//  PokeTypeInteractor.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 9.02.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

protocol PokeTypeBusinessLogic { }

protocol PokeTypeDataStore {
    var type: [String]? { get set }
}

final class PokeTypeInteractor: PokeTypeBusinessLogic, PokeTypeDataStore {
    
    var type: [String]?
    
    var presenter: PokeTypePresentationLogic?
}
