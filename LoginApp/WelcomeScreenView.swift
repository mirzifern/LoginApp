//
//  WelcomeScreenView.swift
//  LoginApp
//
//  Created by Mirzi Coleen Fernando on 1/29/25.
//

import SwiftUI

struct WelcomeScreenView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.4)]),
                                startPoint: .top,
                                endPoint: .bottom)
                     .edgesIgnoringSafeArea(.all)
                VStack (spacing: 20){
                    Spacer()
                    
                    Text("Welcome, " + self.viewModel.username + "!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        self.viewModel.logout()
                    }) {
                        Text("Logout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 300)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y: 5)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

//#Preview {
//    WelcomeScreenView()
//}


