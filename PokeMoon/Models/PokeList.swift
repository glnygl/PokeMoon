//
//  PokeListModel.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

struct PokeList: Codable {
    let data: [Pokemon]?
    
    enum CodingKeys: String, CodingKey {
        case data = "pokemon"
    }
}

struct Pokemon: Codable {
    
    let id: Int?
    let name: String?
    let img: String?
    let type: [String]?
    let weaknesses: [String]?
    
}
