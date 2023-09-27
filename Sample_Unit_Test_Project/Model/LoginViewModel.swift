//
//  LoginViewModel.swift
//  Sample_Unit_Test_Project
//
//  Created by Raivis on 27/09/2023.
//

import Foundation

protocol LoginViewModelProtocol: ObservableObject {
    var isUserEmailInvalid: Bool { get set }
    var isUserPasswordInvalid: Bool { get set }
    var didLogIn: Bool { get set }
    var failedToLogIn: Bool { get set }
    
    func login(email: String, password: String)
}

class LoginViewModel: LoginViewModelProtocol {
    @Published var isUserEmailInvalid: Bool = false
    @Published var isUserPasswordInvalid: Bool = false
    @Published var didLogIn: Bool = false
    @Published var failedToLogIn: Bool = false
    @Published var navigateToNextScreen = false
    private let predefinedEmail: String = "client@client.com"
    private let predefinedPassword: String = "Test1234!"
    
    func login(email: String, password: String) {
        guard !email.isEmpty else { return }
        guard !password.isEmpty else { return }
        isUserEmailInvalid = false
        isUserPasswordInvalid = false
        
        if email == predefinedEmail && password == predefinedPassword {
            didLogIn = true
            failedToLogIn = false
        } else {
            didLogIn = false
            failedToLogIn = true
        }
    }
}
