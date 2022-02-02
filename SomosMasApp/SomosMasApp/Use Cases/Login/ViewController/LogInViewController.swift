//
//  LogInViewController.swift
//  SomosMasApp
//
//  Created by Santiago Caraballo on 27/01/2022.
//

import UIKit

class LogInViewController: UIViewController {

    var loginViewModel = LoginViewModel()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLoginButton()
        setupTextFields()
        bindData()
    }
    
    //MARK: Button Action
    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    
    func bindData() {
        loginViewModel.isButtonLoginShow.bind { [weak self] in
            $0 ? self?.showLoginButton() : self?.hideLoginButton()
        }
        
    }
    
    func showLoginButton() {
        loginButton.isEnabled = true
        loginButton.backgroundColor = .red
    }
    
    // MARK: Buttons Setup
    private func hideLoginButton() {
        loginButton.isEnabled = false
        loginButton.backgroundColor = .white
    }
    
    
    // MARK: Text Fields Setup
    func setupTextFields() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let emailText = emailTextField.text, let passwordText = passwordTextField.text {
            loginViewModel.validateEmail(email: emailText, password: passwordText)
        }
        
        loginViewModel.textFieldsInput()

    }
    
    

}
