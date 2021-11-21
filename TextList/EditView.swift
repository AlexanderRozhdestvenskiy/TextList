//
//  EditView.swift
//  TextList
//
//  Created by Alexander Rozhdestvenskiy on 20.10.2021.
//

import SwiftUI

struct EditView: View {
    
    @Binding var cardData: Card.Data
    
    var body: some View {
        List {
            Section(header: Text("Title")) {
                TextField("Title", text: $cardData.title)
            }
            Section(header: Text("Text")) {
                TextField("Text", text: $cardData.text)
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(cardData: .constant(Card.data[0].data))
    }
}
