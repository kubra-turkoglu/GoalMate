//
//  LoginView.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                Color.cyan
                    .ignoresSafeArea()
                Circle()
                    .scale(1.45)
                    .foregroundStyle(.white.opacity(0.15))
                Circle()
                    .scale(1.2)
                    .foregroundStyle(.white)
                VStack{
                    Spacer().frame(height: 20)
                    
                    Text("Start orginizing goals")
                        .font(.system(size: 35))
                        .foregroundStyle(.white)
                        .accessibilityIdentifier("mainTitle")
                        .accessibilityLabel("mainTitle")
                    
                    Spacer().frame(height: 150)
                    
                    VStack(spacing: 20) {
                        Text("Login")
                            .font(.system(size: 30))
                            .bold()
                            .foregroundStyle(Color.black)
                            .accessibilityIdentifier("loginTitle")
                        
                        VStack(spacing: 15) {
                            TextField(
                                "Email Address",
                                text: $viewModel.email
                            )
                            .background(Color.white)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(10)
                            .autocorrectionDisabled(true)
                            .accessibilityIdentifier("emailField")
                            
                            #if !os(macOS)
                            .textInputAutocapitalization(.never)
                            #endif
                            
                            SecureField("Password", text: $viewModel.password)
                                .background(Color.white)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(10)
                                .autocorrectionDisabled(true)
                                .accessibilityIdentifier("passwordField")
                            
                            TLButton(backgroundColor: .blue , title: "Log In") {
                                //Attempt log in
                                viewModel.login()
                            }
                            .accessibilityIdentifier("loginButton")
                            .accessibilityLabel("loginButton")
                            
                        }
                        .padding(.horizontal, 30)
                        .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                    
                    //Create Account
                    VStack{
                        Text("New around here?")
                        NavigationLink("Create An Account", destination: RegisterView())
                    }
                    .padding(.bottom, 50)
                    
                    Spacer()
                }
            }
            .toolbarVisibility(.hidden, for: .navigationBar)
        }
    }
    
    
}

#Preview {
    LoginView()
}
