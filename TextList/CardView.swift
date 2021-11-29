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
            card.title.map(Text.init)
                .font(.title)
            Spacer()
        }
        .padding()
    }
}
