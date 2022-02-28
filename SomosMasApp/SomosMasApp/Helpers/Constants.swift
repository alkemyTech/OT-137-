//
//  Constants.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 06/02/2022.
//

import Foundation

struct Constants {
    
    struct URL {
        
        static let BASE_URL = Bundle.main.object(forInfoDictionaryKey: "ServerURL") as! String
        
        struct Endpoints {
            
            static let LOGIN = "/login"
<<<<<<< HEAD
            static let REGISTER = "register"
            
=======
            static let REGISTER = "/register"
            static let NEWS = "/news"
>>>>>>> 76bf6f60b91d8650b96c5fa013ff4f10ea2657dd
        }
    }
}
