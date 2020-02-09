//
//  PokeListModels.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

enum PokeListScene {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            let data: [Pokemon]
        }
        
        struct ViewModel {
            
            let data: [Pokemon]
        }
        
    }
    
    enum Show {
        
        struct Request {
            let index: Int
        }
        
        struct Response {

        }
        
        struct ViewModel {
            

        }
        
    }
    
}
