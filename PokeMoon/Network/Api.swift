//
//  Api.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Alamofire

class PokeApi {
    
    static func getPokeList(completion: @escaping (PokeList?) -> Void) {
        Service.request(url: "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json") { (result: PokeList?) in
            completion(result)
        }        
    }
    
}
