//
//  LoginProtocols.swift
//  VIPER
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import Foundation
import UIKit

protocol LoginViewProtocol: AnyObject {
    func showSuccess(_ username: String)
    func showError(_ message:String)
}

protocol LoginPresentorProtocol: AnyObject {
    func login(userName:String, password:String)
}

protocol LoginInteractorProtocol: AnyObject {
    func validateLogin(userName:String, password:String)
}

protocol LoginInteractorOutputProtocol: AnyObject {
    func loginSucceeded(userName:String)
    func loginFailed(with error: String)
}

protocol LoginRouterProtocol: AnyObject {
    func navigateToHome(vc: UIViewController)
}
