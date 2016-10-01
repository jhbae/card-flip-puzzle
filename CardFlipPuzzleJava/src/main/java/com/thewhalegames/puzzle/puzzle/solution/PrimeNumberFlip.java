package com.thewhalegames.puzzle.puzzle.solution;


import java.util.*;
import java.util.stream.IntStream;

/**
 * Created by luke.bae on 2016. 10. 1..
 */
public class PrimeNumberFlip extends CardFlipSolution {

    @Override
    public List<Boolean> flipAllCardsByRule(final List<Boolean> cards) {

        List<Boolean> result = new ArrayList<Boolean> (cards);

        IntStream.range(0, cards.size())
                .filter(each -> each > 0 && getNumberOfDivisors(each + 1) % 2 == 1)
                .forEach(each -> result.set(each, false));

        return result;
    }

    private int getNumberOfDivisors(final int number) {

        Map<Integer, Integer> countsOfPrimeNumber = new HashMap<>();

        int dividedNumber = number;

        for (;;) {
            int primeDivisor = this.getPrimeDivisor(dividedNumber);
            if (countsOfPrimeNumber.putIfAbsent(primeDivisor, 1) != null) {
                countsOfPrimeNumber.put(primeDivisor, countsOfPrimeNumber.get(primeDivisor) + 1);
            }

            if (dividedNumber == primeDivisor) {
                break;
            }

            dividedNumber /= primeDivisor;
        }

        Integer totalCountOfDivisors = countsOfPrimeNumber.entrySet().stream()
                .mapToInt(each -> each.getValue() + 1)
                .reduce(1, Math::multiplyExact);

        return totalCountOfDivisors - 1;
    }

    private int getPrimeDivisor(final int number) {

        if (number % 2 == 0) {
            return 2;
        }

        for (int i = 3; i * i <= number; i+=2) {
            if (number % i == 0) {
                return i;
            }
        }

        return number;
    }
}
