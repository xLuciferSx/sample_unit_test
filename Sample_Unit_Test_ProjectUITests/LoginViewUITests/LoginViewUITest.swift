//
//  LoginViewUITest.swift
//  Sample_Unit_Test_ProjectUITests
//
//  Created by Raivis on 27/09/2023.
//

import XCTest

final class LoginViewUITest: XCTestCase {
    var app: XCUIApplication!
    var loginPage: LoginPage!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        loginPage = LoginPage(app: app)
    }
    
    func testUIElementsExist() throws {
        XCTAssertTrue(loginPage.emailTextField.exists)
        XCTAssertTrue(loginPage.passwordTextField.exists)
        XCTAssertTrue(loginPage.loginButton.exists)
    }
    
    func testSuccessfulLogin() throws {
        loginPage.login(email: "client@client.com", password: "Test12345!")
        
        let loginFailedAlert = app.staticTexts["Login Failed"]
        
        XCTAssertFalse(loginFailedAlert.waitForExistence(timeout: 3), "Login should have succeeded but did not.")
    }
    
    func testFailedLogin() throws {
        loginPage.login(email: "wrongemail@example.com", password: "wrongpassword")
        
        let loginFailedAlert = app.staticTexts["Login Failed"]
        
        XCTAssertTrue(loginFailedAlert.waitForExistence(timeout: 3), "Login should have failed but did not.")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
