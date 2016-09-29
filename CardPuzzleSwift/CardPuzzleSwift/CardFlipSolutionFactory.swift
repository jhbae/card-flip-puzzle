//
//  FlipCardSolutionFactory.swift
//  CardPuzzleSwift
//
//  Created by luke.bae on 2016. 9. 28..
//  Copyright © 2016년 Luke Bae. All rights reserved.
//

import Foundation


class CardFlipSolutionFactory {

    enum SolutionType {
        case PrimeNumberSolution
        case MultiplesSolution
        case BruteForceSolution
    }

    static func create(type:SolutionType) -> CardFlipSolution? {
        switch type {
        case .PrimeNumberSolution:
            return PrimeNumberFlip()
        case .MultiplesSolution:
            return MultiplesFlip()
        default:
            return nil
        }
    }
}
