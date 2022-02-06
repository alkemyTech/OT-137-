//
//  LoginDataResponse.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 06/02/2022.
//

import Foundation

class LoginDataResponse: Codable {
    
    let user: [User]
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case user
        case token
    }
    
}

class User: Codable {
    let id: Int
    let name: String
    let email: String
    
}


