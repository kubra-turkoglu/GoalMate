//
//  RegisterFormView.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/31/25.
//

import SwiftUI

struct RegisterFormView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        Form{
            TextField(
                "Full Name",
                text: $viewModel.username
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocorrectionDisabled()
            .accessibilityIdentifier("fullName")
            
            TextField(
                "Email Address",
                text: $viewModel.email
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .accessibilityIdentifier("registerEmailField")
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .accessibilityIdentifier("registerPasswordField")
            
            TLButton(
                backgroundColor: .green,
                title: "Create Account"
            ){
                //Attempt register
                viewModel.register()
            }
            .accessibilityIdentifier("CreateAccountButton")
        }
        .alert(viewModel.alertMessage, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel){}
        }
    }
}

#Preview {
    RegisterFormView()
}
