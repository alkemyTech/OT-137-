//
//  LogInViewController.swift
//  SomosMasApp
//
//  Created by Santiago Caraballo on 27/01/2022.
//

import UIKit

class LogInViewController: UIViewController {

    var loginViewModel = LoginViewModel()
    
    @IBOutlet weak var emailTextField: UnderlinedtextField!
    @IBOutlet weak var passwordTextField: UnderlinedtextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var credentials: UIView!
    
    
    let somosMasImageView: UIImageView = {
        let logo = UIImage(named: "LOGO-SOMOS-MAS")
        let imageView = UIImageView(image: logo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLoginButton()
        setupTextFields()
        bindData()
        
        //UI LogInLayout
        
        setupLayout()
        
        
    }
    
    //MARK: Button Action
    @IBAction func loginButtonPressed(_ sender: Any) {
        loginViewModel.loginUser()
    }
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        let signUpVC = SignUpViewController(nibName: "SignUpViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func bindData() {
        loginViewModel.isButtonLoginShow.bind { [weak self] in
            $0 ? self?.showLoginButton() : self?.hideLoginButton()
        }
        
    }
    
    func showLoginButton() {
        loginButton.isEnabled = true
    }
    
    // MARK: Buttons Setup
    private func hideLoginButton() {
        loginButton.isEnabled = false
        loginButton.backgroundColor = .clear
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
    
    // Layout Setup
    private func setupLayout() {
        
        // Creating Logo contraints
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        //Subview contraints
        topImageContainerView.addSubview(somosMasImageView)
        somosMasImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        somosMasImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true

        //credentials constraints
        credentials.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 40).isActive = true
        
        
        //Icons on the left of text fields
        let user = UIImage(systemName: "person")
        addLeftImage(txtField: emailTextField, andimage: user!)
        let password = UIImage(systemName: "lock")
        addLeftImage(txtField: passwordTextField, andimage: password!)
        
    }
    
    func addLeftImage(txtField: UITextField, andimage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 15, width: 20, height: 20))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    
    
}
