//
//  LoginScreenView.swift
//  LoginApp
//
//  Created by Mirzi Coleen Fernando on 1/29/25.
//

import SwiftUI

struct LoginScreenView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @State private var isSecure: Bool = true
    @State private var isAlertPresented: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.4)]),
                                startPoint: .top,
                                endPoint: .bottom)
                     .edgesIgnoringSafeArea(.all)
                
                VStack (spacing: 20){
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    
                    TextField("Username", text: self.$viewModel.username)
                        .autocapitalization(.none)
                        .frame(width: 300, height: 40, alignment: .center)
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    
                    HStack {
                        if isSecure {
                            SecureField("Password", text: self.$viewModel.password)

                        } else {
                            TextField("Password", text: self.$viewModel.password)
                        }
                        
                        Button(action: {
                            isSecure.toggle()
                        }) {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                                .frame(height:40)
                        }
                    }
                    .frame(width: 300, height: 40, alignment: .center)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    
                    Button(action: {
                        if self.viewModel.username.isEmpty || self.viewModel.password.isEmpty {
                            self.isAlertPresented = true
                        } else {
                            self.viewModel.login()
                        }
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 300)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y: 5)
                    }
                    
                }
                .padding()
                
                Spacer()
            }
            .alert(isPresented: self.$isAlertPresented) {
                Alert(title: Text("Oops!"), message: Text("Please input username and/or password."), dismissButton: .default(Text("OK")))
            }
        }
    }
}

//#Preview {
//    LoginScreenView()
//}

