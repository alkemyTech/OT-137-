//
//  SignUpViewModel.swift
//  SomosMasApp
//
//  Created by Mariano Uriel Delgado on 10/02/2022.
//

import Foundation
import UIKit
import Alamofire

class SignUpViewModel {
    
   
    
    //var signUpViewController = SignUpViewController()
    
     func SignUp(name: String, email: String, password: String) {
            let signUp = SignUpModel(name: name, email: email, password: password)
            APIManager.shared.registerUser(register: signUp)
            { (isSuccess) in
                if isSuccess{
                    
                    
                }else{
                   
                }
                
            }
    }
    
    
    
  
    
    
    
    
}
