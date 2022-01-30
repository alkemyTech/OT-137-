//
//  SignUpViewController.swift
//  TestProject
//
//  Created by Antonella Brini Vago on 26/01/2022.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameField: UnderlinedtextField!
    @IBOutlet weak var mailField: UnderlinedtextField!
    @IBOutlet weak var phoneField: UnderlinedtextField!
    @IBOutlet weak var passwordField: UnderlinedtextField!
    @IBOutlet weak var confirmPasswordField: UnderlinedtextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDismissKeyboard()
    }
    
    @IBAction func Edit(_ sender: Any) {

//        nameField.underline.borderWidth = 1
//        nameField.underline.borderColor = UIColor.cyan.cgColor
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
