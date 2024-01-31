//
//  LoginViewModel.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import Foundation
import SwiftUI

struct IdentifiableAlert: Identifiable {
    var id = UUID()
    var alert: Alert
}


enum ValidationError: String, Error {
    case invalidEmail = "Invalid Email"
    case invalidPassword = "Invalid Password"
    case invalidConfirmPassword = "Invalid confirm password"
    case emptyName = "Name cannot be empty"
    case emptyEmail = "Email cannot be empty"
    case emptyPassword = "Password cannot be empty"
}

enum ValidationState {
    case valid
    case invalid(ValidationError)
}


class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var alert: IdentifiableAlert?
    
    func validateInput() -> ValidationState {
        
        if email.isEmpty {
            return .invalid(.emptyEmail)
        } else if !email.isValidEmail()  {
            return .invalid(.invalidEmail)
        } else if password.isEmpty  {
            return .invalid(.emptyPassword)
        }
        
        return .valid
    }
    
    func loginTapped(uiState: UIState) {
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
