//
//  ToDoListView.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ListItemModel]
    
//    private let userID: String (We actually need this let anymore. Because we set the user ID in our ListItemModel.)
    
    init(userID: String) {
//        self.userID = userID
        //users/ <id> / todos / <entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userID: userID))
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ListItemsView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(itemID: item.id)
                            } label: {
                                Image(systemName: "trash.circle.fill")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                
            }
        
        .navigationTitle("To Do List")
        .toolbar {
            Button {
                //Action
                viewModel.showingNewItemView = true
            } label: {
                Image(systemName: "plus.circle")
            }
        }
        .sheet(isPresented: $viewModel.showingNewItemView) {
            NewItemView(newItemPresented: $viewModel.showingNewItemView)
        }
        }
    }
}

#Preview {
    ToDoListView(userID: "EVD4C1rOGffO3i0PSC5tuiXiicN2")
}
