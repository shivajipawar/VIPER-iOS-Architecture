//
//  LoginPresenter.swift
//  VIPER
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import Foundation
import UIKit

class LoginPresenter{
    var interactor: LoginInteractorProtocol?
    weak var view:LoginViewProtocol?
    var router: LoginRouterProtocol?
    
}

extension LoginPresenter: LoginPresentorProtocol {
    func login(userName: String, password: String) {
        interactor?.validateLogin(userName: userName, password: password)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    
    func loginSucceeded(userName:String){
        if let vc = view as? UIViewController {
            router?.navigateToHome(vc: vc)
        }
    }
    func loginFailed(with error: String){
        view?.showError(error)
    }
}

