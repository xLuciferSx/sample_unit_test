//
//  ContentView.swift
//  Sample_Unit_Test_Project
//
//  Created by Raivis on 27/09/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject private var viewModel = LoginViewModel()
    @State private var navigateToNextScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .accessibilityIdentifier("Email")
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .accessibilityIdentifier("Password")
                    
                    Button("Login") {
                        viewModel.login(email: email, password: password)
                        if viewModel.didLogIn {
                            navigateToNextScreen = true
                        }
                    }
                    .accessibilityIdentifier("Login")
                    .background(
                        NavigationLink("", destination: Text("You're Logged In"), isActive: $navigateToNextScreen)
                            .hidden()
                    )
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .padding(.horizontal, 40)
                
                if viewModel.failedToLogIn {
                    CustomAlertView()
                        .offset(y: -300)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
