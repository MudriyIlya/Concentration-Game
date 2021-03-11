//
//  Card.swift
//  Concentration
//
//  Created by Илья Мудрый on 05.03.2021.
//

import Foundation

struct Card: Hashable {
    
    // MARK: Conform to protocols HASHABLE & EQUATABLE
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    // MARK: Model
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
