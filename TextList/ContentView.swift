//
//  ContentView.swift
//  TextList
//
//  Created by Alexander Rozhdestvenskiy on 20.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var cards: [Card]
    @State private var isPresented = false
    @State private var newCardData = Card.Data()
    
    var body: some View {
        List {
            ForEach(cards) { card in
                NavigationLink(destination: DetailView(card: binding(for: card))) {
                    CardView(card: card)
                }
            }
        }
        .navigationTitle("Cards")
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $isPresented) {
            NavigationView {
                EditView(cardData: $newCardData)
                    .navigationBarItems(leading: Button("Dismiss") {
                        isPresented = false
                    }, trailing: Button("Add") {
                        let newCard = Card(title: newCardData.title, text: newCardData.text)
                        cards.append(newCard)
                        isPresented = false
                    })
            }
        }
    }
    
    private func binding(for card: Card) -> Binding<Card> {
        guard let cardIndex = cards.firstIndex(where: { $0.id == card.id }) else {
            fatalError("Cant")
        }
        return $cards[cardIndex]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(cards: .constant(Card.data))
        }
    }
}
