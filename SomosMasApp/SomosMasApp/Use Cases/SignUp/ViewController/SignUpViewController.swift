//
//  SignUpViewController.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 04/02/2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var signUPViewModel = SignUpViewModel()
    
    @IBOutlet weak var stackScrollViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var nameField: UnderlinedtextField!
    @IBOutlet weak var mailField: UnderlinedtextField!
    @IBOutlet weak var phoneField: UnderlinedtextField!
    @IBOutlet weak var passwordField: UnderlinedtextField!
    @IBOutlet weak var confirmPasswordField: UnderlinedtextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDismissKeyboard()
        setupTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setupTextFields()
    }
    
   
   
    
    func setupTextFields() {
        
        nameField.setupUnderline()
        mailField.setupUnderline()
        phoneField.setupUnderline()
        passwordField.setupUnderline()
        confirmPasswordField.setupUnderline()
        
        let user = UIImage(systemName: "person")
        addLeftImage(txtField: nameField, andimage: user!)
        let mail = UIImage(systemName: "envelope")
        addLeftImage(txtField: mailField, andimage: mail!)
        let phone = UIImage(systemName: "phone")
        addLeftImage(txtField: phoneField, andimage: phone!)
        let password = UIImage(systemName: "lock")
        addLeftImage(txtField: passwordField, andimage: password!)
        let confirmPassword = UIImage(systemName: "lock.rotation")
        addLeftImage(txtField: confirmPasswordField, andimage: confirmPassword!)
    }
    
    func addLeftImage(txtField: UITextField, andimage img: UIImage) {
        let leftImageView = UIImageView()
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }

    @IBAction func btnSignUp(_ sender: UIButton) {
        
        guard let name = self.nameField.text else { return }
        guard let email = self.mailField.text else { return }
        guard let password = self.passwordField.text else { return }
        
        signUPViewModel.SignUp(name: name, email: email, password: password)
        }
    }
extension SignUpViewController{
    
    func showAlert(){
        
        let showAlert = UIAlertController(title: "Succes", message: "User was succesfully register", preferredStyle: .alert)
        
        showAlert.addAction(UIAlertAction(title: "Accept", style: .cancel, handler: { action in
            
            _ = self.navigationController?.popViewController(animated: true)
        }))
        
        present (showAlert, animated: true)
        
    }
}

extension SignUpViewController {
    func setUpDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
extension SignUpViewController {
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    private func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
       
        UIView.animate(withDuration: animationDuration) {
            self.stackScrollViewConstraint.constant = keyboardFrame.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
       
        UIView.animate(withDuration: animationDuration) {
            self.stackScrollViewConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
}




