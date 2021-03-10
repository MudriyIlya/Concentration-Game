//
//  ViewController.swift
//  Concentration
//
//  Created by Илья Мудрый on 04.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: VARIABLES & CONSTANTS
    // MARK: UI Variables
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!

    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // MARK: Game Initialization
    var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count / 2)
        }
    }
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    // MARK: Emoji
    private var emojiChoices = ["🥰","😘","😍","🤪", "🙌🏻","👋🏻","😱","🍑","❤️", "😈"]
    private var emoji = [Int: String]()
    
    // MARK: METHODS
    // MARK: UI Actions
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButton")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices { 
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
