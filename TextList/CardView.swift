//
//  CardView.swift
//  TextList
//
//  Created by Alexander Rozhdestvenskiy on 20.10.2021.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    var body: some View {
        HStack {
            Text(card.title)
                .font(.title)
            Spacer()
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.data[0])
    }
}
