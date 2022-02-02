//
//  SignUpViewController.swift
//  TestProject
//
//  Created by Antonella Brini Vago on 26/01/2022.
//

import UIKit
import IQKeyboardManager

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameField: UnderlinedtextField!
    @IBOutlet weak var mailField: UnderlinedtextField!
    @IBOutlet weak var phoneField: UnderlinedtextField!
    @IBOutlet weak var passwordField: UnderlinedtextField!
    @IBOutlet weak var confirmPasswordField: UnderlinedtextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDismissKeyboard()
        
        IQKeyboardManager.shared().isEnabled = true
        
        let us = UIImage(systemName: "person")
        addLeftImage(txtField: nameField, andimage: us!)
        let em = UIImage(systemName: "envelope")
        addLeftImage(txtField: mailField, andimage: em!)
        let ph = UIImage(systemName: "phone")
        addLeftImage(txtField: phoneField, andimage: ph!)
        let ps = UIImage(systemName: "lock")
        addLeftImage(txtField: passwordField, andimage: ps!)
        let cps = UIImage(systemName: "lock")
        addLeftImage(txtField: confirmPasswordField, andimage: cps!)
        
    }
    
    @IBAction func Edit(_ sender: Any) {

//        nameField.underline.borderWidth = 1
//        nameField.underline.borderColor = UIColor.cyan.cgColor
    }
    
    func addLeftImage(txtField: UITextField, andimage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 15, width: 20, height: 20))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
}

extension SignUpViewController {
    func setUpDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(){
        view.endEditing(true)
    }



}
