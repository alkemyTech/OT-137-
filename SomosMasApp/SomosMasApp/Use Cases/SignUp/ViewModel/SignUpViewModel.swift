//
//  SignUpViewModel.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 07/02/2022.
//

import Foundation
import UIKit

class SignUpViewModel {
    
    struct DataModalError {
        let titleModalError: String
        let modalMessage: String
        let titleButton: String
    }
    
//    let signUpWS = SignUpAPI()
    
    private var user = ""
    private var email = ""
    private var phone = ""
    private var password = ""
    private var confirmPassword = ""
    private var isValidUser = false
    private var isValidEmail = false
    private var isValidPhone = false
    private var isValidPassword = false
    private var isValidConfirmPassword = false
    var isMatchPassword = false
    
    var isButtonSignUpShow: Observable<Bool> = Observable(false)
    
    func validateAccount(user: String, email: String, phone: String, password: String, confirmPassword: String) {
        isValidUser = user.isValidUser ? true : false
        isValidEmail = email.isValidEmail ? true : false
        isValidPhone = phone.isValidPhone ? true : false
        isValidPassword = password.isValidPassword ? true : false
        isValidConfirmPassword = confirmPassword.isValidConfirmPassword ? true : false
        isMatchPassword = (password == confirmPassword) ? true : false
    }
    
    func textFieldsInput() {
        if isValidUser && isValidEmail && isValidPhone && isValidPassword && isValidConfirmPassword && isMatchPassword {
            isButtonSignUpShow.value = true
        } else {
            isButtonSignUpShow.value = false
        }
    }
    
    func getTextError() -> DataModalError {
        let titleModalError = "Error de registro"
        let modalMessage = "Usuario ya registrado"
        let titleButton = "Aceptar"
        
        let dataModalError = DataModalError(titleModalError: titleModalError, modalMessage: modalMessage, titleButton: titleButton)
        return dataModalError
    }
    
    func signUp(completion: @escaping (Bool) -> ()) {
        completion(false)
        //TODO: [OT137-23]
    }
}
