//
//  LoginInteractorTests.swift
//  VIPERTests
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import XCTest
@testable import VIPER

class LoginInteractorTests : XCTestCase {
    
    class MockPresenter : LoginInteractorOutputProtocol {
        
        var didSucceed = false
        var errorMsg = ""
        
        func loginSucceeded(userName:String){
            didSucceed = true
        }
        func loginFailed(with error: String){
            errorMsg = error
        }
        
    }
    
    
    func test_validCredentials_callsSuccess(){
        let interactor = LoginInteractor()
        let presenter = MockPresenter()
        interactor.presenter = presenter
        
        interactor.validateLogin(userName: "admin", password: "admin")
        
        XCTAssertTrue(presenter.didSucceed)
    }
    
    func test_invalidCredentials_callsFailure() {
            let interactor = LoginInteractor()
            let presenter = MockPresenter()
            interactor.presenter = presenter

        interactor.validateLogin(userName: "user", password: "wrong")

            XCTAssertEqual(presenter.errorMsg, "Invalid username or password.")
        }
}
