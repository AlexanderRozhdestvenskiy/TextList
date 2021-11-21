//
//  TextListApp.swift
//  TextList
//
//  Created by Alexander Rozhdestvenskiy on 20.10.2021.
//

import SwiftUI

@main
struct TextListApp: App {
    
    @State private var cards = Card.data
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(cards: $cards)
            }
        }
    }
}
