//
//  DetailView.swift
//  TextList
//
//  Created by Alexander Rozhdestvenskiy on 20.10.2021.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var card: Card
    
    @State private var data: Card.Data = Card.Data()
    
    @State private var isPres = false
    
    var body: some View {
        List {
            Section {
                Text(card.text)
            }
        }
        .navigationTitle(card.title)
        .navigationBarItems(trailing: Button("Edit") {
            isPres = true
            data = card.data
        })
        .fullScreenCover(isPresented: $isPres) {
            NavigationView {
                EditView(cardData: $data)
                    .navigationTitle(card.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPres = false
                    }, trailing: Button("Done") {
                        isPres = false
                        card.update(from: data)
                    })
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(card: .constant(Card.data[0]))
        }
    }
}
