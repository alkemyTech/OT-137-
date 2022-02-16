//
//  SignUpViewModel.swift
//  SomosMasApp
//
<<<<<<< HEAD
//  Created by Mariano Uriel Delgado on 10/02/2022.
=======
//  Created by Antonella Brini Vago on 07/02/2022.
>>>>>>> 7e479f9be2795b20433cb67edf5eec61537b8af4
//

import Foundation
import UIKit
<<<<<<< HEAD
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
    
    
    
  
    
    
    
    
=======

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
>>>>>>> 7e479f9be2795b20433cb67edf5eec61537b8af4
}
