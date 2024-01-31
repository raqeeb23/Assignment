//
//  ProfileView.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import SwiftUI

struct ProfileView: View {
    let profileData: ContentProfile
    var body: some View {
        Text(profileData.image.absoluteString)
        Text(profileData.name)
        Text(profileData.email)

    }
}

#Preview {
    ProfileView(profileData: ContentProfile(image: URL(string: "HelloWorld.com")!, name: "Shaikh", email: "rakib@gmail.com"))
}
