//
//  UIState.swift
//  Assignment
//
//  Created by Shaikh Rakib on 29/01/24.
//

import Foundation
import SwiftUI

enum AppUIState {
    case login
    case home
}

class UIState: ObservableObject {
    @Published var currentAppUIState: AppUIState = .login
    
    func changeState(state: AppUIState) {
        Task {
            await MainActor.run {
                currentAppUIState = state
            }
        }
    }
}
