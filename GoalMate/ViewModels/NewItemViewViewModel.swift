//
//  NewItemViewViewModel.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewItemViewViewModel : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert: Bool = false
    
    init() {
        
    }
    func save() {
        guard canSave else {
            return
        }
        //Get current user id
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        //Create model
        let newID = UUID().uuidString
        let newItem = ListItemModel(
            id: newID,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        //Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDict())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
