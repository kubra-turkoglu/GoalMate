//
//  LoginViewViewModel.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {}
    func login() {
        //Checking that all fields are filled in properly
        guard validate() else {
            return
        }
        //Log in
        Auth.auth().signIn(withEmail: email, password: password) 
    }
    private func validate() -> Bool {
        //empty field error
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        //not valid email error
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
