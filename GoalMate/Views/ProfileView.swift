//
//  ProfileView.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
            
            .padding()
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: UserModel) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125, height: 125)
        // Info: Name, Email, Member since
        VStack {
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            .padding()
            
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            .padding()
            
            HStack {
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        //Sign out
        TLButton(
            backgroundColor: .red,
            title: "Log Out"
        ) {
            viewModel.logOut()
        }
        .padding()
        Spacer()
    }
}

#Preview {
    ProfileView()
}
