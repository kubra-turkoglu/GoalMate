//
//  UserModel.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
