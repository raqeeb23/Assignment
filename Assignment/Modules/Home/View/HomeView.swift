//
//  HomeView.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        TabView {
            ForEach(viewModel.uiData, id: \.type) { data in
                view(tab: data.content)
                    .tabItem {
                        tabItem(tab: data.content)
                    }
            }
        }
        .onAppear { viewModel.getData() }
    }
    
    
    @ViewBuilder
    func view(tab: CodableContent) -> some View {
        VStack {
            switch tab {
            case .profile(let profile) :
                ProfileView(profileData: profile)
            case .map(let map):
                MapView(mapData: map)
            case .data(let data):
                DataView(data: data)
                    
            }
        }
    }
    
    
    @ViewBuilder
    func tabItem(tab: CodableContent) -> some View {
        VStack {
            switch tab {
            case .profile(_) :
                VStack {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            case .map(_):
                VStack {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            case .data(_):
                VStack {
                    Image(systemName: "book.fill")
                    Text("Data")
                }
            }
        }
    }
    
    
}

#Preview {
    HomeView()
}
