//
//  LoginRouter.swift
//  VIPER
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import UIKit

class LoginRouter{
    static func createModule() -> UIViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
    
        
        return view
        
    }
}

extension LoginRouter : LoginRouterProtocol{
    func navigateToHome(vc: UIViewController){
        let homeVC = HomeViewController()
        vc.navigationController?.pushViewController(homeVC, animated: true)
    }
}
