//
//  Card.swift
//  Concentration
//
//  Created by Илья Мудрый on 05.03.2021.
//

import Foundation

struct Card {
    // MARK: Variables & Constants
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    // MARK: Methods
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
