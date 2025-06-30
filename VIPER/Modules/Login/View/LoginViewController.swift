//
//  LoginViewController.swift
//  VIPER
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    var presenter: LoginPresentorProtocol!
    
    internal let txtUserName: UITextField = UITextField()
    internal let txtPassword: UITextField = UITextField()
    private let btnLogin: UIButton = UIButton(type: .system)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        txtUserName.placeholder = "Username"
        txtPassword.placeholder = "Password"
        txtPassword.isSecureTextEntry = true
        btnLogin.setTitle("Login", for: .normal)
        
        txtUserName.accessibilityIdentifier = "Username"
        txtPassword.accessibilityIdentifier = "Password"
        btnLogin.accessibilityIdentifier = "Login"
        
        [txtUserName,txtPassword,btnLogin].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        btnLogin.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            txtUserName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            txtUserName.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            txtUserName.widthAnchor.constraint(equalToConstant: 200),

            txtPassword.centerXAnchor.constraint(equalTo: txtUserName.centerXAnchor),
            txtPassword.topAnchor.constraint(equalTo: txtUserName.bottomAnchor, constant: 10),
            txtPassword.widthAnchor.constraint(equalTo: txtUserName.widthAnchor),
            
            btnLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnLogin.topAnchor.constraint(equalTo: txtPassword.bottomAnchor , constant: 10),
            btnLogin.widthAnchor.constraint(equalToConstant: 100)
        ])
        

        
    }
    
    @objc func loginTapped(){
        let username = txtUserName.text ?? ""
        let password = txtPassword.text ?? ""
        presenter.login(userName: username, password: password)
    }
}

extension LoginViewController : LoginViewProtocol{
    func showSuccess(_ username: String ) {
        let alert = UIAlertController(title: "Welcome", message: username, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    
}
