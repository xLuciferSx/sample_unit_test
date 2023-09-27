//
//  LoginViewUnitTests.swift
//  Sample_Unit_Test_ProjectTests
//
//  Created by Raivis on 27/09/2023.
//

import XCTest
@testable import Sample_Unit_Test_Project

final class LoginViewUnitTests: XCTestCase {
    var viewModel: LoginViewModel!

    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testSuccessfulLogin() {
        viewModel.login(email: "client@client.com", password: "Test1234!")
        
        XCTAssertTrue(viewModel.didLogIn, "User loggedin succesfully")
        XCTAssertFalse(viewModel.failedToLogIn, "User failed to login")
    }
    
    func testFailedLogin() {
        viewModel.login(email: "client2@client.com", password: "Test12345!")
        
        XCTAssertTrue(viewModel.failedToLogIn)
        XCTAssertFalse(viewModel.didLogIn, "This test failed because user was logged in")
    }
}
