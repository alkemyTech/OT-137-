//
//  LoginUserResponse.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 06/02/2022.
//

import Foundation

struct LoginUserResponse: Codable {
    
    let succes: Bool
    let data: [LoginDataResponse]
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case succes
        case data
        case message
    }
    
}
