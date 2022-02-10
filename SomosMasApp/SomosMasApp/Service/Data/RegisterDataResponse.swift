//
//  RegisterDataResponse.swift
//  SomosMasApp
//
//  Created by Mariano Uriel Delgado on 10/02/2022.
//

import Foundation

struct RegisterDataResponse: Codable {
    
    let registeruser: [RegisterUser]
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case registeruser
        case token
    }
    
}

struct RegisterUser: Codable {
    let id: Int
    let name: String
    let email: String
    
}
