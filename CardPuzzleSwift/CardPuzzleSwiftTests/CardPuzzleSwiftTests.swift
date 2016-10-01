//
//  CardPuzzleSwiftTests.swift
//  CardPuzzleSwiftTests
//
//  Created by luke.bae on 2016. 9. 28..
//  Copyright © 2016년 Luke Bae. All rights reserved.
//

import XCTest
@testable import CardPuzzleSwift

class CardPuzzleSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPuzzleSolutions() {

        let maxBound = 100
        let cards = Array.init(repeating: true, count: maxBound)

        var solution: CardFlipSolution = CardFlipSolutionFactory.create(type:.MultiplesSolution)!

        let result = solution.flipAllCardsByRule(arrayOfCards: cards);
        var count = solution.countOfFlippedCards(arrayOfCards: result)

        print("** Number of flipped cards with MultiplesSolution: \(count) \n")
        solution.printFlippedCards(arrayOfCards: result)

        print("\n")

        solution = CardFlipSolutionFactory.create(type:.PrimeNumberSolution)!
        let result2 = solution.flipAllCardsByRule(arrayOfCards: cards);
        count = solution.countOfFlippedCards(arrayOfCards: result2)

        print("** Number of flipped cards with PrimeNumberSolution: \(count) \n")
        solution.printFlippedCards(arrayOfCards: result2)

        XCTAssert(result == result2)
    }
}
