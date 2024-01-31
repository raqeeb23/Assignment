//
//  AppView.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import SwiftUI

struct AppView: View {
    @StateObject var uiState: UIState = UIState()
    var body: some View {
            switch uiState.currentAppUIState {
            case .login:
                NavigationStack {
                    LoginView()
                }
                .environmentObject(uiState)
            case .home:
                HomeView()
            }
        }
}

#Preview {
    AppView()
}
