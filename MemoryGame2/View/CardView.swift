//
//  Card.swift
//  MemoryGame2

import UIKit

class CardView {
    let card: UIButton
    //MARK: On init - connect unique cardModel instance for each cardView
    let model: CardModel
    init(model: CardModel) {
        self.model = model
        card = UIButton()
        card.frame = CGRect(x: 100, y: 100, width: 70, height: 90)
        card.backgroundColor = .systemBlue
        card.setTitle("", for: .normal)
    }

}
