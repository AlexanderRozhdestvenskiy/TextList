//
//  ContentView.swift
//  TextList
//
//  Created by Alexander Rozhdestvenskiy on 20.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: Card.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Card.title, ascending: true)
        ]
    ) var cards: FetchedResults<Card>
    
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cards, id: \.title) {
                    CardView(card: $0)
                }
                .onDelete(perform: deleteMovie)
            }
            .sheet(isPresented: $isPresented) {
                EditView { title, text in
                    self.addCard(title: title, text: text)
                    self.isPresented = false
                }
            }
            .navigationTitle("Cards")
            .navigationBarItems(trailing: Button(action: {
                self.isPresented.toggle()
            }) {
                Image(systemName: "plus")
            })
        }
    }
    
    func deleteMovie(at offset: IndexSet) {
        offset.forEach { index in
            let card = self.cards[index]
            self.managedObjectContext.delete(card)
        }
        
        saveContext()
    }
    
    func addCard(title: String, text: String) {
        let newCard = Card(context: managedObjectContext)
        
        newCard.title = title
        newCard.text = text
        
        saveContext()
    }
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
