//
//  LoginView.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @EnvironmentObject var uiState: UIState
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 20){
                CapsuleTextFieldView(placeholder: "Email", text: $viewModel.email)
                CapsuleSecureFieldView(placeholder: "Password", text: $viewModel.password)
                
                CapsuleButtonView(label: "Login", action: { viewModel.loginTapped(uiState: uiState) })
                
                NavigationLink(destination: SignupView()) {
                    Text("Sign Up")
                }
                
            }
            .padding(.horizontal)
            
            Spacer()
            
        }
        .navigationTitle("Login")
        .alert(item: $viewModel.alert) { alert in
            alert.alert
        }
        
    }
}

#Preview {
    NavigationStack {
        LoginView()
        
    }
}


