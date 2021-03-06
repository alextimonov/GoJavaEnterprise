package ua.goit.timonov.enterprise.module_1.logic;

import java.util.Set;

/**
 * Implementation of operation populate for Set
 */
public class TestSetPopulate extends TestSet {
    public TestSetPopulate(Set collection, int nElements) {
        super(collection, nElements);
    }

    @Override
    public long fixTimeOfOperation() {
        collection.clear();
        long startTime = System.nanoTime();
        for (int i = 0; i < nElements; i++) {
            collection.add(rand.nextInt(Integer.MAX_VALUE));
        }
        long finishTime = System.nanoTime();
        return finishTime - startTime;
    }

}
