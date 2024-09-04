//
//  Models.swift
//  MemoryGame2
//
//  Created by Ion Socol on 28.08.2024.
//

import UIKit

class CardModel {
    
    static var identifierNumber = 0
    static var emojiCollection = ["🌵", "💩", "👽", "🤖", "☠️", "🥎", "🏉", "🏓", "🥮", "🌍", "🌈", "💧"]
    var id: Int
    var isFacedUp = false
    var isMatched = false
    var emoji = String()


    init() {
        id = CardModel.idGenerator()
        emoji = CardModel.emojiGenerator()
    }
    static func emojiGenerator() -> String {
        // Make sure there are emojis left to choose from
        guard !emojiCollection.isEmpty else {
            return ""
        }

        // Generate a random index
        let randomIndex = Int.random(in: 0..<emojiCollection.count)
        // Retrieve the emoji at the random index
        let selectedEmoji = emojiCollection[randomIndex]
        // Remove the emoji from the collection
        emojiCollection.remove(at: randomIndex)

        return selectedEmoji
    }
    static func idGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
}
