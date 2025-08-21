//
//  ContentView.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            //signed in
            BrowseTabView(userID: viewModel.currentUserID)
        } else {
                LoginView()
            }
    }
}
struct BrowseTabView: View {
    @State private var selection = 0
    let userID: String
    var body: some View {
        TabView(selection: $selection) {
            Tab("Home", systemImage: "house.circle", value: 0) {
                ToDoListView(userID: userID)
            }
            .accessibilityIdentifier("homeTab")
            
            Tab("Profile", systemImage: "person.crop.circle.fill", value: 1) {
                ProfileView()
            }
            .accessibilityIdentifier("profileTab")
        }
    }
}

#Preview {
    ContentView()
}
