package com.thewhalegames.puzzle.puzzle.solution;


import java.util.List;
import java.util.stream.IntStream;

/**
 * Created by luke.bae on 2016. 10. 1..
 */
public abstract class CardFlipSolution {

    /**
     * Process flipping cards with its own solution
     *
     * @param cards array of cards to apply flip solutions
     */
    public abstract List<Boolean> flipAllCardsByRule(final List<Boolean> cards);

    public void printAllCards(final List<Boolean> cards) {
        IntStream.range(0, cards.size())
                .forEach(each -> System.out.println((each + 1) + ": " + cards.get(each)));
        System.out.println("\n");
    }

    public void printFlippedCards(final List<Boolean> cards) {
        IntStream.range(0, cards.size())
                .filter(each -> !cards.get(each))
                .forEach(each -> System.out.print((each + 1) + ", "));
        System.out.println("\n");
    }

    public int countFlippedCards(final List<Boolean> cards) {

        return (int)IntStream.range(0, cards.size())
                .filter(each -> !cards.get(each))
                .count();
    }
}

