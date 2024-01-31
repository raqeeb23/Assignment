//
//  HomeViewModel.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var uiData = [UiItem]()
    
    func getData() {
        do {
            let objects = try JSONDecoder().decode([UiItem].self, from: json)
            for object in objects {
                print(object)
            }
            
            uiData = objects

        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
