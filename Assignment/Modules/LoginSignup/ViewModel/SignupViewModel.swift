//
//  SignupViewModel.swift
//  Assignment
//
//  Created by Shaikh Rakib on 30/01/24.
//

import Foundation
import SwiftUI


class SignupViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var name: String = ""
    @Published var alert: IdentifiableAlert?
    
    func validateInput() -> ValidationState {
        if name.isEmpty {
            return .invalid(.emptyName)
        } else if email.isEmpty {
            return .invalid(.emptyEmail)
        } else if !email.isValidEmail()  {
            return .invalid(.invalidEmail)
        } else if password.isEmpty  {
            return .invalid(.emptyPassword)
        } else if confirmPassword != password  {
            return .invalid(.invalidConfirmPassword)
        }
        return .valid
    }
    
    func signupTapped(uiState: UIState) {
        switch validateInput() {
        case .invalid(let error):
            alert = IdentifiableAlert(alert: Alert(title: Text("Alert"),message: Text(error.rawValue)))
            print("invalid \((error))")
        case .valid:
            print("valid")
            //uiState.currentAppUIState = .home
            uiState.changeState(state: .home)
        }
    }
}
