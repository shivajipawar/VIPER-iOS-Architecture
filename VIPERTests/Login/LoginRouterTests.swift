//
//  LoginRouterTests.swift
//  VIPERTests
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import XCTest
@testable import VIPER

class LoginRouterTests: XCTestCase {

    class MockNavController: UINavigationController {
        var didPushViewController: Bool = false
        var pushedViewController: UIViewController?

        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            didPushViewController = true
            pushedViewController = viewController
            super.pushViewController(viewController, animated: false)
        }
    }

    func test_navigateToHome_pushesHomeVC() {
        let router = LoginRouter()
        let viewController = UIViewController()
        let navController = MockNavController(rootViewController: viewController)

        router.navigateToHome(vc: navController)

        XCTAssertTrue(navController.didPushViewController)
        XCTAssertTrue(navController.pushedViewController is HomeViewController)
    }
}
