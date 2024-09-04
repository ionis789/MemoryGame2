//
//  MemoryGame.swift
//  MemoryGame2
//
//  Created by Ion Socol on 27.08.2024.
//

import Foundation

class MemoryGame {
    // MARK: Array of card models instance
    var cards = [CardModel]()
    static var pickedCardPairs = 0
    var lastPickedCard: CardView? = nil

    init(cardPairsCount: Int) {
        MemoryGame.pickedCardPairs = cardPairsCount
        for _ in 0..<cardPairsCount {
            let card = CardModel()
            cards += [card, card]
        }
        cards.shuffle()
    }

    func flipCard(for pickedCard: CardView) {
        if lastPickedCard == nil {
            lastPickedCard = pickedCard
            pickedCard.model.isFacedUp = true
            pickedCard.card.setTitle(pickedCard.model.emoji, for: .normal)
        } else {

            if checkMatch(pickedCard: pickedCard) {
                MemoryGame.pickedCardPairs -= 1
                pickedCard.model.isMatched = true
                pickedCard.card.setTitle(pickedCard.model.emoji, for: .normal)
                lastPickedCard = nil
                if MemoryGame.pickedCardPairs == 0 {
                    print("Game end")
                }
            } else {
                lastPickedCard?.card.setTitle("", for: .normal)
                resetCard(for: pickedCard)
                resetCard(for: lastPickedCard!)
                lastPickedCard = nil
                print("Cards dont match")
            }
        }

    }
    func resetCard(for card: CardView) {
        card.card.setTitle("", for: .normal)
        card.model.isFacedUp = false
    }
    func checkMatch(pickedCard: CardView) -> Bool {
        if pickedCard.model.id == lastPickedCard?.model.id && pickedCard.model.isFacedUp == true {
            return true
        } else if lastPickedCard != nil && pickedCard.model.id != lastPickedCard?.model.id {
            return false
        }
        return false
    }
}
