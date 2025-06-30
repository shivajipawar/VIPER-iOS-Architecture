//
//  LoginViewControllerSnapshotTests.swift
//  VIPERUITests
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import XCTest
//import SnapshotTesting
@testable import VIPER

class LoginViewControllerSnapshotTests: XCTestCase {

    override func setUp() {
            super.setUp()
        // isRecording = true // Set to true only when generating baseline images
    }

    /*
    func test_LoginViewController_defaultState() {
            let vc = LoginViewController()
            vc.presenter = MockLoginPresenter()

            let nav = UINavigationController(rootViewController: vc)

            // Force layout
            nav.view.frame = UIScreen.main.bounds
            nav.view.layoutIfNeeded()

            assertSnapshot(matching: nav, as: .image(on: .iPhone13))
        }

        func test_LoginViewController_withError() {
            let vc = LoginViewController()
            vc.presenter = MockLoginPresenter()
            _ = vc.view  // Force load

            vc.showError("Invalid credentials")

            let nav = UINavigationController(rootViewController: vc)
            nav.view.frame = UIScreen.main.bounds
            nav.view.layoutIfNeeded()

            assertSnapshot(matching: nav, as: .image(on: .iPhone13))
        }*/
}

extension LoginViewControllerSnapshotTests{
    // MARK: - Mock Presenter
       class MockLoginPresenter: LoginPresentorProtocol {
           func login(userName username: String, password: String) { }
       }
}
