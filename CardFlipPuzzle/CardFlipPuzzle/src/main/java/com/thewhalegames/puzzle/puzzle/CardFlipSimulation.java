package com.thewhalegames.puzzle.puzzle;


import com.thewhalegames.puzzle.puzzle.solution.CardFlipSolution;
import com.thewhalegames.puzzle.puzzle.solution.SolutionType;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by luke.bae on 2016. 10. 1..
 */
public class CardFlipSimulation {

    public static void main(String [] args) {
        List<Boolean> cards = new ArrayList<>(Collections.nCopies(100, true));

        CardFlipSolution solution = CardFlipSolutionFactory.create(SolutionType.MultiplesFlip);
        List<Boolean> result = solution.flipAllCardsByRule(cards);
        int count = solution.countFlippedCards(result);

        System.out.println("** Number of flipped cards with MultiplesFlip: " + count);
        solution.printFlippedCards(result);


        solution = CardFlipSolutionFactory.create(SolutionType.PrimeNumberFlip);
        List<Boolean> result2 = solution.flipAllCardsByRule(cards);
        count = solution.countFlippedCards(result2);

        System.out.println("** Number of flipped cards with PrimeFlip: " + count);
        solution.printFlippedCards(result2);


        result.removeAll(result2);
        if (result.size() == 0) {
            System.out.println("test success");
        }
    }
}
