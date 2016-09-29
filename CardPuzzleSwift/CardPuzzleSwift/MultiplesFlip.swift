//
//  ProcessFlip.swift
//  CardPuzzleSwift
//
//  Created by luke.bae on 2016. 9. 28..
//  Copyright © 2016년 Luke Bae. All rights reserved.
//

import Foundation


class MultiplesFlip: CardFlipSolution {


    func flipAllCardsByRule(arrayOfCards cards:[Bool]) -> [Bool] {

        var lastStateOfCards = cards
        for i in 2...cards.count {
            lastStateOfCards = flipCardsOfMultiples(forTheRound: i, withBound:cards.count, arrayOfCards:lastStateOfCards)
        }

        return lastStateOfCards
    }


   private func flipCardsOfMultiples(forTheRound:Int, withBound maxBound:Int, arrayOfCards cards:[Bool]) -> [Bool] {

        var tempCards = cards

        for j in stride(from: forTheRound, through: Int(maxBound / forTheRound) * forTheRound, by: forTheRound) {
            tempCards[j-1] = !tempCards[j-1]
        }

        return tempCards
    }
}
