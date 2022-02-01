//
//  LoginViewModel.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 30/01/2022.
//

import Foundation
import UIKit

class LoginViewModel {
    
    private var credentials = Credentials() {
        didSet {
            email = credentials.email
            password = credentials.password
        }
    }
    
    private var email = ""
    private var password = ""
    private var isValidEmail = false
    private var isValidPassword = false
    
    var isButtonLoginShow: Observable<Bool> = Observable(false)
    
    func validateEmail(email: String, password: String) {
        isValidEmail = email.isValidEmail ? true : false
        isValidPassword = password.isValidPassword ? true : false
    }
    
    func textFieldsInput() {
        if isValidEmail && isValidPassword {
            isButtonLoginShow.value = true
        } else {
            isButtonLoginShow.value = false
        }
    }
    
}
