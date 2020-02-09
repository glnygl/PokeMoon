//
//  Service.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Alamofire
import AlamofireImage

class Service {
    
    static func request<T: Codable>(url: String, completion: @escaping (T?) -> Void) {
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                if let data = response.data, let decodedData : T = try? JSONDecoder().decode(T.self, from: data){
                    completion(decodedData)
                }else{
                 completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }

    @discardableResult
    static func imageRequest(url: String) -> DataRequest {
        return Alamofire.request(url)
    }
}




