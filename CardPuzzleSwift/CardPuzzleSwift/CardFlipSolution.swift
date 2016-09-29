//
//  CardFlipSolution.swift
//  CardPuzzleSwift
//
//  Created by luke.bae on 2016. 9. 29..
//  Copyright © 2016년 Luke Bae. All rights reserved.
//

import Foundation


protocol CardFlipSolution {
    /**
     Get flipped cards by the rule

     - Parameter cards :Deck of Cards to solve puzzle
     - returns: Flipped cards
     */
    func flipAllCardsByRule(arrayOfCards cards:[Bool]) -> [Bool]
}

extension CardFlipSolution {

    func printAllCards(arrayOfCards cards:[Bool]) {
        for i in 0..<cards.count {
            print("\(i+1): \(cards[i])", terminator: " ")
            if (i % 10 == 9) {
                print("")
            }
        }
    }

    func printFlippedCards(arrayOfCards cards:[Bool]) {
        for i in 0..<cards.count {
            if cards[i] == false {
                print("\(i+1)", terminator: ",")
            }
        }
    }

    func countOfFlippedCards(arrayOfCards cards:[Bool]) -> Int {
        var count = 0;
        for item in cards {
            if (item) {
                count += 1;
            }
        }
        return count;
    }
}
