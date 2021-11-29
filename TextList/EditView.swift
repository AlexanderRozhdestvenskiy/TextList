//
//  EditView.swift
//  TextList
//
//  Created by Alexander Rozhdestvenskiy on 20.10.2021.
//

import SwiftUI

struct EditView: View {
    
    static let defaultCardTitle = "Card"
    static let defaultCardText = "Text"
    
    @State private var title = ""
    @State private var text = ""
    
    let onComplete: (String, String) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: $title)
                }
                Section(header: Text("Text")) {
                    TextEditor(text: $text)
                        .lineSpacing(16)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                }
                
                Section {
                    Button(action: addMoveAction) {
                        Text("Add Card")
                    }
                }
            }
            .navigationBarTitle(Text("Add Card"), displayMode: .inline)
        }
    }
    private func addMoveAction() {
        onComplete(
            title.isEmpty ? EditView.defaultCardTitle : title,
            text.isEmpty ? EditView.defaultCardText : text
        )
    }
}
