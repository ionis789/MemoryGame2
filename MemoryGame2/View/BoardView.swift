//
//  Board.swift
//  MemoryGame2
//
//  Created by Ion Socol on 26.08.2024.
//

import UIKit

class BoardView {
    let boardView: UIView
    var boardWidth = CGFloat()
    var boardHeight = CGFloat()
    init() {
        boardView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: boardWidth, height: boardHeight)))
        boardView.backgroundColor = .green
    }

}
