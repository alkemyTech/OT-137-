//
//  AlamofireAPICliente.swift
//  SomosMasApp
//
//  Created by Mariano Uriel Delgado on 26/01/2022.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }
    }
    
}
