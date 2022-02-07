//
//  SignUpViewModel.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 07/02/2022.
//

import Foundation
import UIKit

class SignUpViewModel {
    
    private var email = ""
    private var password = ""
    private var isValidEmail = false
    private var isValidPassword = false
    
    var isButtonSignUpShow: Observable<Bool> = Observable(false)
    
    func validateEmail(email: String, password: String) {
        isValidEmail = email.isValidEmail ? true : false
        isValidPassword = password.isValidPassword ? true : false
    }
    
    func textFieldsInput() {
        if isValidEmail && isValidPassword {
            isButtonSignUpShow.value = true
        } else {
            isButtonSignUpShow.value = false
        }
    }
}
