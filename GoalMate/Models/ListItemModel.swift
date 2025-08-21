//
//  ListItemModel.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import Foundation

struct ListItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
