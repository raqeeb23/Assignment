//
//  CapsuleSecureFieldView.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import SwiftUI

struct CapsuleSecureFieldView: View {
    var placeholder: String
    @Binding var text: String
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .background(
                Capsule()
                    .stroke(Color.gray.opacity(0.5))
            )
    }
}

#Preview {
    CapsuleSecureFieldView(placeholder: "Password", text: .constant(""))
}
