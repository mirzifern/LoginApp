//
//  LoginViewModel.swift
//  LoginApp
//
//  Created by Mirzi Coleen Fernando on 1/29/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var isLoggingIn: Bool = false
    
    func login() {
        //simulate login
        isLoggingIn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoggingIn = false
            self.isAuthenticated = true
        }
    }
    
    func logout() {
        isAuthenticated = false
        username = ""
        password = ""
    }
}
