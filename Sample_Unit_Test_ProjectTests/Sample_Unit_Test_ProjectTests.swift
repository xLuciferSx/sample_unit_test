//
//  Sample_Unit_Test_ProjectTests.swift
//  Sample_Unit_Test_ProjectTests
//
//  Created by Raivis on 27/09/2023.
//

import XCTest
@testable import Sample_Unit_Test_Project

final class Sample_Unit_Test_ProjectTests: XCTestCase {
    
    var viewModel: LoginViewModel!

    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testSuccesfulLogin() {
        viewModel.login(email: "client@client.com", password: "Test1234!")
        XCTAssertTrue(viewModel.didLogIn)
        XCTAssertFalse(viewModel.failedToLogIn)
    }
    
    func testFailedLogin() throws {
        viewModel.login(email: "wrongemail@example.com", password: "wrongpassword")
        
        XCTAssertFalse(viewModel.didLogIn)
        XCTAssertTrue(viewModel.failedToLogIn)
    }
    
    func testEmptyEmailAndPassword() throws {
        viewModel.login(email: "", password: "")
        
        XCTAssertFalse(viewModel.didLogIn)
        XCTAssertFalse(viewModel.failedToLogIn)
    }
}
