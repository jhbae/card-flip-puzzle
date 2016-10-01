package com.thewhalegames.puzzle.puzzle;


import com.thewhalegames.puzzle.puzzle.solution.CardFlipSolution;
import com.thewhalegames.puzzle.puzzle.solution.MultiplesFlip;
import com.thewhalegames.puzzle.puzzle.solution.PrimeNumberFlip;
import com.thewhalegames.puzzle.puzzle.solution.SolutionType;

/**
 * Created by luke.bae on 2016. 10. 1..
 */
public class CardFlipSolutionFactory {

    static CardFlipSolution create(SolutionType type) {
        switch (type) {
            case MultiplesFlip:
                return new MultiplesFlip();
            case PrimeNumberFlip:
                return new PrimeNumberFlip();
            default:
                throw new RuntimeException("There is no such type: " + type);
        }
    }

}
