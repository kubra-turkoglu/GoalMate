//
//  RegisterViewViewModel.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
    }
    private func insertUserRecord(id: String) {
        let newUser = UserModel(id: id,
                           name: username,
                           email: email,
                                joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDict())
    }
    
    private func validate() -> Bool {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertMessage = "You must fill the whole blanks!"
            showAlert = true
            return false
        }
        let allowedDomains = ["@gmail.com", "@hotmail.com", "@yahoo.com"]
        guard allowedDomains.contains(where: { email.contains($0)}) else {
            alertMessage = "Email must be gmail, hotmail, or Yahoo"
            showAlert = true
            return false
        }
        guard password.count >= 8 else {
            alertMessage = "Password must be at least 8 characters long."
            showAlert = true
            return false
        }
        return true
    }
}
