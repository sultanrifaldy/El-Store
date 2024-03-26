//
//  LoginViewController.swift
//  E Store
//
//  Created by Bayu Yasaputro on 07/10/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTitleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setup()
    }
    
    func setup() {
        titleLabel.text = "Masuk"
        emailTitleLabel.text = "Alamat email"
        emailTextField.placeholder = "Email Anda"
        passwordTitleLabel.text = "Kata sandi"
        passwordTextField.placeholder = "Kata sandi Anda"
        loginButton.setTitle("Masuk", for: UIControl.State.normal)
        loginButton.layer.cornerRadius = 4
        loginButton.layer.masksToBounds = true
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("email: \(String(describing: emailTextField.text))")
        print("password: \(String(describing: passwordTextField.text))")
        
    }
    
}
