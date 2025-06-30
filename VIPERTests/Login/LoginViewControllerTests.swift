//
//  LoginViewControllerTests.swift
//  VIPERTests
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import XCTest
@testable import VIPER

class LoginViewControllerTests : XCTestCase {
    
    class MockPresenter: LoginPresentorProtocol {
           var didLogin = false
           var username = ""
           var password = ""

        func login(userName username: String, password: String) {
               didLogin = true
               self.username = username
               self.password = password
           }
    }
    
    // You may need to expose txtUserName, txtPassword, and loginTapped() as internal or @testable.
    
    func test_loginButton_callsPresenter() {
        
        let view = LoginViewController()
        let presenter = MockPresenter()
        view.presenter = presenter
        
        // Load view hierarchy
        _ = view.view
        
      //  view.performSelector(onMainThread: #selector(setupFields), with: nil, waitUntilDone: true)
        view.txtUserName.text = "admin"
        view.txtPassword.text = "admin"
        
        // Trigger login button tap
        view.loginTapped()
        
        
        XCTAssertTrue(presenter.didLogin)
        XCTAssertEqual(presenter.username, "admin")
        XCTAssertEqual(presenter.password, "admin")
    }
    
    
    func test_showError_displaysAlert() {
            let view = LoginViewController()
            _ = view.view

            view.showError("Test Error")
            
            let expectation = XCTestExpectation(description: "Alert Presented")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                XCTAssertTrue(view.presentedViewController is UIAlertController)
                let alert = view.presentedViewController as? UIAlertController
                XCTAssertEqual(alert?.message, "Test Error")
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 1.0)
        }
    
}
