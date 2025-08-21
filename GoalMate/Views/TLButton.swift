//
//  TLButton.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 8/1/25.
//

import SwiftUI

struct TLButton: View {
    let backgroundColor: Color
    let title: String
    let action: () -> Void
    var body: some View {
        Button{
            
            action()
//            autheticateUser(username: username, password: password)
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width:300, height: 50)
                    .foregroundStyle(backgroundColor)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        .padding()
    }
//    func autheticateUser(username: String, password: String) {
//        if username.lowercased() == "kubra2025" {
//            wrongUsername = 0
//            if password.lowercased() == "123456" {
//                wrongPassword = 0
//                showingLoginScreen = true
//            } else {
//                wrongPassword = 2
//            }
//        } else {
//            wrongUsername = 2
//        }
//    }
}

#Preview {
    TLButton(backgroundColor: .blue, title: "Log In"){
        //Action
    }
}
