//
//  LoginPage.swift
//  Sample_Unit_Test_ProjectUITests
//
//  Created by Raivis on 27/09/2023.
//

import XCTest

struct LoginPage {
    var app: XCUIApplication
    
    var emailTextField: XCUIElement {
        app.textFields["Email"]
    }
    
    var passwordTextField: XCUIElement {
        app.secureTextFields["Password"]
    }
    
    var loginButton: XCUIElement {
        app.buttons["Login"]
    }
    
    func login(email: String, password: String) {
        emailTextField.tap()
        emailTextField.typeText(email)
        
        passwordTextField.tap()
        passwordTextField.typeText(password)
        
        loginButton.tap()
    }
}
