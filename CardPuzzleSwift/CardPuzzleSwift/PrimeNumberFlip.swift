//
//  PrimeNumber.swift
//  CardPuzzleSwift
//
//  Created by luke.bae on 2016. 9. 28..
//  Copyright © 2016년 Luke Bae. All rights reserved.
//

import Foundation


class PrimeNumberFlip: CardFlipSolution {

    func processFlipAllCards(arrayOfCards cards:[Bool]) -> [Bool] {

        var tempCards = cards
        tempCards[0] = true
        for i in 2...cards.count {
            if self.numberOfDivisors(withNumber: i) % 2 == 1 {
                tempCards[i-1] = false
            } else {
                tempCards[i-1] = true
            }
        }
        return tempCards
    }

    private func numberOfDivisors(withNumber number:Int) -> Int {

        var countOfDivisors: [Int : Int] = [:]
        var dividedNumber = number

        while true {
            let primeDivisor = self.primeDivisor(withNumber: dividedNumber)

            if countOfDivisors[primeDivisor] == nil {
                countOfDivisors[primeDivisor] = 1
            } else {
                countOfDivisors[primeDivisor]! += 1
            }

            if dividedNumber == primeDivisor {
                break
            }

            dividedNumber /= primeDivisor
        }

        var totalCount = 1
        for (_, value) in countOfDivisors {
            totalCount *= (value + 1)
        }
        return totalCount - 1
    }

    private func primeDivisor(withNumber number:Int) -> Int {

        let maxRange = Int(sqrt(Double(number)))
        let primeDivisor = number

        //integer fractioning
        //1. To speed up, handle multiples of 2 first
        if (primeDivisor % 2 == 0) {
            return 2
        }

        //2. Just deal with odd numbers to speed up
        for i in stride(from: 3, through: maxRange, by: 2) {
            if (primeDivisor % i == 0) {
                return i
            }
        }

        return primeDivisor
    }


    /**
     Get prime numbers within the range (2...given number)
     
     Not used for now
     - parameter withBound: max limit to find prime numbers within
     - returns: found prime numbers
     */
    private func eratos(withBound maxBound:Int) -> [Int] {

        var primeNumberMarker: [Bool] = Array.init(repeating: true, count: maxBound)

        let maxRange = Int(sqrt(Double(maxBound)))

        /*TODO: To optimize this method  1.handle multiples of 2  2.then handle odd number */
        for i in 2...maxRange {
            if (primeNumberMarker[i-1]) {
                for j in stride(from:i * i, through:maxBound, by:i) {
                    primeNumberMarker[j-1] = false
                }
            }
        }

        var result:[Int] = []
        for i in 2...maxBound {
            if (primeNumberMarker[i-1]) {
                result.append(i)
            }
        }
        
        return result
    }

}
