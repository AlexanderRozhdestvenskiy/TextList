//
//  Model.swift
//  TextList
//
//  Created by Alexander Rozhdestvenskiy on 20.10.2021.
//

import Foundation

struct Card: Identifiable {
    var id: UUID
    var title: String
    var text: String
    
    init(id: UUID = UUID(), title: String, text: String) {
        self.id = id
        self.title = title
        self.text = text
    }
}

extension Card {
    static var data: [Card] {
        [
            Card(title: "First", text: "Go to home"),
            Card(title: "Second", text: "I love you")
        ]
    }
}

extension Card {
    struct Data {
        var title: String = ""
        var text: String = ""
    }
    
    var data: Data {
        return Data(title: title, text: text)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        text = data.text
    }
}
