//
//  CardNumberPicker.swift
//  MemoryGame2
//
//  Created by Ion Socol on 28.08.2024.
//

import UIKit

class CardCountPickerView {
    var textFieldPicker: UITextField
    var buttonPicker: UIButton
    init() {
        textFieldPicker = UITextField()
        textFieldPicker.placeholder = "Insert pairs of card"
        textFieldPicker.frame = CGRect(x: 30, y: 750, width: 120, height: 50)
        textFieldPicker.borderStyle = .roundedRect
        
        buttonPicker = UIButton()
        buttonPicker.setTitle("Start", for: .normal)
        buttonPicker.frame = CGRect(x: 200, y: 750, width: 60, height: 50)
        buttonPicker.backgroundColor = .systemMint
    }
}
