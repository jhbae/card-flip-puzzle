package com.thewhalegames.puzzle.puzzle.solution;


import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * Created by luke.bae on 2016. 10. 1..
 */
public class MultiplesFlip extends CardFlipSolution {

    @Override
    public List<Boolean> flipAllCardsByRule(final List<Boolean> cards) {
        Map<Integer, Boolean> map = IntStream.range(0, cards.size())
                .boxed()
                .collect(Collectors.toMap (i -> i, cards::get));

        for (int i = 2; i <= cards.size(); i++) {
            map = flipCardsOfMutilples(i, map);
        }

        List<Boolean> result = map.entrySet().stream()
                .sorted(Comparator.comparing(Map.Entry::getKey))
                .map(Map.Entry::getValue)
                .collect(Collectors.toList());

        return result;
    }

    public Map<Integer, Boolean> flipCardsOfMutilples(final int divisor, final Map<Integer, Boolean> cards) {

        cards.entrySet().parallelStream()
                .filter(each -> each.getKey() > 0 && (each.getKey() + 1) % divisor == 0)
                .forEach(each -> cards.put(each.getKey(), !cards.get(each.getKey())));

        return cards;
    }
}
