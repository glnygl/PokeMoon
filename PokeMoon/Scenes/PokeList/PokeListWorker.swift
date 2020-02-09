//
//  PokeListWorker.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

typealias PokeListHandler = ([Pokemon]?) -> Void

protocol PokeListWorkingLogic {
    func fetchPokemons(completion: @escaping PokeListHandler)
}

final class PokeListWorker: PokeListWorkingLogic {
    func fetchPokemons(completion: @escaping PokeListHandler) {
        PokeApi.getPokeList { (result) in
            if let data = result?.data {
               completion(data)
            } else {
               completion(nil)
            }
        }        
    }    
}
