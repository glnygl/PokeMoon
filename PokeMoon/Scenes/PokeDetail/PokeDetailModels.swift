//
//  PokeListModels.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

enum PokeDetailScene {
    
    enum Show {
        
        struct Request {
            let imageURl: String
        }
        
        struct Response {
            let data: Pokemon
        }
        
        struct ViewModel {
           let data: Pokemon
        }
        
    }
    
}
