//
//  LoginPresenterTests.swift
//  VIPERTests
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import XCTest
@testable import VIPER


class LoginPresenterTests: XCTestCase {
    
    class MockView:LoginViewProtocol {
        var errorShown = ""
        var successUsername  = ""
        
        func showSuccess(_ username: String){
            successUsername = username
        }
        func showError(_ message:String){
            errorShown = message
        }
    }
    
    
    class MockInteractor:LoginInteractorProtocol {
        
        var didCallValidate = false
        func validateLogin(userName:String, password:String){
            didCallValidate = true
        }
    }
    
    class MockRouter: LoginRouterProtocol {
        
        var didNavigate = false
        func navigateToHome(vc: UIViewController){
            didNavigate = true
        }
        
    }
    
    func test_login_callsInteractor(){
        
        let view = MockView()
        let presentor = LoginPresenter()
        let interactor = MockInteractor()
        let router = MockRouter()
        
        presentor.view = view
        presentor.interactor = interactor
        presentor.router = router
        
        
        presentor.login(userName: "admin", password: "admin")
        
        XCTAssertTrue(interactor.didCallValidate)
        
        
    }
    
    func test_loginFailed_showsError() {
            let presenter = LoginPresenter()
            let view = MockView()
            presenter.view = view

            presenter.loginFailed(with: "Wrong!")

            XCTAssertEqual(view.errorShown, "Wrong!")
        }
    
    
    func test_loginSucceeded_navigatesToHome() {
        
        class DummyVC: UIViewController, LoginViewProtocol {
            
            var errorShown = ""
            func showError(_ message: String) {}
            func showSuccess(_ username: String) {}
        }

            let presenter = LoginPresenter()
            let view = DummyVC()
            let router = MockRouter()

            presenter.view = view
            presenter.router = router

            presenter.loginSucceeded(userName: "admin")
            XCTAssertTrue(router.didNavigate)
        }
    
}
