//
//  ViewController.swift
//  MemoryGame2
//
//  Created by Ion Socol on 25.08.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Propreties
    var cards: [CardView] = []
    let board = BoardView()

    var cardCountPicker = CardCountPickerView()
    var game = MemoryGame(cardPairsCount: 8)
    

    override func viewDidLoad() {
        super.viewDidLoad()


        setBoardSize(board: board.boardView, padding: 10)
        board.boardView.center = view.center
        self.view.addSubview(cardCountPicker.textFieldPicker)
        self.view.addSubview(cardCountPicker.buttonPicker)
        self.view.addSubview(board.boardView)

        /// Iterate through cards array, set position,and touchGesture for each card
        for (index, cardModel) in game.cards.enumerated() {
            let cardView = CardView(model: cardModel)
            cards.append(cardView)
            setCardPosition(card: cardView.card, index: index, padding: 10)
            board.boardView.addSubview(cardView.card)
            cardView.card.addTarget(self, action: #selector(buttonTouch(_:)), for: .touchUpInside)
            print(cardModel.id)
        }
    }

    /// Set board size
    func setBoardSize(board: UIView, padding: CGFloat) {
        board.frame.size.width = CGFloat(70 * 4) + CGFloat(padding * 3)
        board.frame.size.height = CGFloat(90 * 4) + CGFloat(padding * 3)
    }

    func setCardPosition(card: UIButton, index: Int, padding: CGFloat) {
        let xOffset = CGFloat(index % 4) * (70 + padding)
        let yOffset = CGFloat(index / 4) * (90 + padding)
        card.frame.origin = CGPoint(x: xOffset, y: yOffset)
    }


    @objc func buttonTouch(_ sender: UIButton) {
        if let pickedCard = getCard(for: sender) {
            if !pickedCard.model.isMatched {
                game.flipCard(for: pickedCard)
            }
            
            print("Card id: \(pickedCard.model.id)")
        }
        if MemoryGame.pickedCardPairs == 0 {
            let alertController = UIAlertController(title: "Game end", message: "You successfully end the game", preferredStyle: .alert)
            let gameEndAlert = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(gameEndAlert)
            self.present(alertController, animated: true, completion: nil)
        }


    }
    func getCard(for button: UIButton) -> CardView? {
        return cards.first { $0.card == button }
    }
}
