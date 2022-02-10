//
//  RegisterUserResponse.swift
//  SomosMasApp
//
//  Created by Mariano Uriel Delgado on 10/02/2022.
//

import Foundation

struct RegisterUserResponse: Codable {
    
    let succes: Bool
    let data: [RegisterDataResponse]
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case succes
        case data
        case message
    }
    
}
