//
//  LoginProgressView.swift
//  LoginApp
//
//  Created by Mirzi Coleen Fernando on 1/30/25.
//

import SwiftUI

struct LoginProgressView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.4)]),
                                startPoint: .top,
                                endPoint: .bottom)
                     .edgesIgnoringSafeArea(.all)
                
                ProgressView("Logging In...")
            }
        }
    }
}

#Preview {
    LoginProgressView()
}
