//
//  ContentView.swift
//  LoginApp
//
//  Created by Mirzi Coleen Fernando on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isAuthenticated {
                    WelcomeScreenView().environmentObject(self.viewModel)
                } else if viewModel.isLoggingIn {
                    LoginProgressView()
                } else {
                    LoginScreenView().environmentObject(self.viewModel)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
