//
//  HeaderView.swift
//  GoalMate
//
//  Created by Kubra Bozdogan on 7/31/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack {
            //Title at the top
            Text("Goal Mate")
                .font(.system(size: 50))
                .foregroundStyle(Color.white)
                .bold()
            
            //Second title
            Text("Get things done")
                .font(.system(size: 30))
                .foregroundStyle(.white)
            
            Spacer()
        }
        .padding(.top, 30)
    }
}
#Preview {
    HeaderView(title: "Goal Mate", subtitle: "Get things done")
}
