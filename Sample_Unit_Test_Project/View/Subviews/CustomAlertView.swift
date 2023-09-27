//
//  CustomAlertView.swift
//  Sample_Unit_Test_Project
//
//  Created by Raivis on 27/09/2023.
//

import Foundation
import SwiftUI

struct CustomAlertView: View {
    var body: some View {
        VStack {
            Text("Login Failed")
                .font(.headline)
                .foregroundColor(.white)
            Text("Please try again.")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.red)
        .cornerRadius(10)
    }
}
