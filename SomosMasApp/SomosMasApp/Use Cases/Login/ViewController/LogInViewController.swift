//
//  LogInViewController.swift
//  SomosMasApp
//
//  Created by Santiago Caraballo on 27/01/2022.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginButton()
        setupTextFields()

    }
    
    //MARK: Button Action
    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    
    
    
    // MARK: Buttons Setup
    private func setupLoginButton() {
        loginButton.isEnabled = false
    }
    
    
    // MARK: Text Fields Setup
    func setupTextFields() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        //validateTextField()
    }

}
