//
//  CapsuleButtonView.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import SwiftUI

struct CapsuleButtonView: View {
    var label: String
    var action: ()->()
    
    var body: some View {
        Button(action: action, label: {
            Text(label)
                .foregroundStyle(.white)
                .bold()
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Capsule())
        })
    }
}

#Preview {
    CapsuleButtonView(label: "Hello", action: {})
}
