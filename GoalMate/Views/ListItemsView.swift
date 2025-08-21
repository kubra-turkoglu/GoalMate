//
//  ListItemsView.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import SwiftUI

struct ListItemsView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ListItemModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    ListItemsView(item: .init(
        id: "123",
        title: "Get 3 eggs",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: true
    ))
}
