//
//  LoginUITests.swift
//  VIPERUITests
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import XCTest

final class LoginUITests: XCTestCase {

    let app = XCUIApplication()

       override func setUp() {
           super.setUp()
           continueAfterFailure = false
           XCUIDevice.shared.orientation = .portrait
           app.launch()
       }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        XCUIDevice.shared.orientation = .portrait
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    
    func test_successfulLogin_navigatesToHome() {
            let usernameField = app.textFields["Username"]
            let passwordField = app.secureTextFields["Password"]
            let loginButton = app.buttons["Login"]

            XCTAssertTrue(usernameField.exists)
            XCTAssertTrue(passwordField.exists)
            XCTAssertTrue(loginButton.exists)

            usernameField.tap()
            usernameField.typeText("admin")

            passwordField.tap()
            passwordField.typeText("admin")

            loginButton.tap()

            let homeTitle = app.staticTexts["Welcome to the Home Screen!"]
            XCTAssertTrue(homeTitle.waitForExistence(timeout: 2.0))
        }
    
    func test_failedLogin_showsErrorAlert() {
            let usernameField = app.textFields["Username"]
            let passwordField = app.secureTextFields["Password"]
            let loginButton = app.buttons["Login"]

            usernameField.tap()
            usernameField.typeText("wrong")

            passwordField.tap()
            passwordField.typeText("user")

            loginButton.tap()

            let alert = app.alerts.firstMatch
            XCTAssertTrue(alert.waitForExistence(timeout: 2.0))
            XCTAssertTrue(alert.staticTexts["Invalid username or password."].exists)

            alert.buttons["Ok"].tap()
            XCTAssertFalse(alert.exists)
        }
}
