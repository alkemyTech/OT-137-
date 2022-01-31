//
//  Strings+Extensions.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 30/01/2022.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
            NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
        }
    
    var isValidPassowrd: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$").evaluate(with: self)
    }
    
    
}
