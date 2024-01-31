//
//  SignupView.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel = SignupViewModel()
    @EnvironmentObject var uiState: UIState
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                
                CapsuleTextFieldView(placeholder: "Name", text: $viewModel.name)
                CapsuleTextFieldView(placeholder: "Email", text: $viewModel.email)
                CapsuleSecureFieldView(placeholder: "Password", text: $viewModel.password)
                CapsuleSecureFieldView(placeholder: "Confirm Password", text: $viewModel.confirmPassword)
                CapsuleButtonView(label: "Sign up", action: { viewModel.signupTapped(uiState: uiState) })
                
                Button(action: {dismiss()}, label: {
                    Text("Login")
                })
                Spacer()
            }
            .padding()
            
        }
        .navigationTitle("Sign up")
        .alert(item: $viewModel.alert) { alert in
            alert.alert
        }
    }
}

#Preview {
    NavigationStack {
        SignupView()
    }
}
