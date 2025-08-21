//
//  ToDoListViewViewModel.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import FirebaseFirestore
import Foundation

//ViewModel for list of items view.
//Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userID: String
    
    init(userID : String) {
        self.userID = userID
    }
    
    /// Delete to do list item
    /// - Parameter id : Item id to delete
    func delete(itemID: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(itemID)
            .delete()
    }
}
