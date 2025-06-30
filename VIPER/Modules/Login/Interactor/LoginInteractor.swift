//
//  LoginInteractor.swift
//  VIPER
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import Foundation
import UIKit

class LoginInteractor{
    weak var presenter:LoginInteractorOutputProtocol?
}

extension LoginInteractor : LoginInteractorProtocol{
    func validateLogin(userName:String, password:String){
        if userName == "admin" && password == "admin"{
            presenter?.loginSucceeded(userName: userName)
        }else{
            presenter?.loginFailed(with:  "Invalid username or password.")
        }
    }
}


