//
//  ToDoListItemViewViewModel.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

//ViewModel for single to do list item view(each row in items list)

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ListItemModel) {
        var copiedItem = item
        copiedItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(copiedItem.id)
            .setData(copiedItem.asDict())
    }
}
