//
//  RegisterView.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/30/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                //Backround image
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    //Header
                    HeaderView(title: "Goal Mate", subtitle: "Get things done")
                    
                    //Login Form
                    RegisterFormView()
                        
                        .padding(.horizontal, 20)
                        .padding(.bottom, 80)
                        .offset(y: -75)
                    
                    Spacer()
                }
                .offset(y: -20)
            }
            
        }
    }
}

#Preview {
    RegisterView()
}



