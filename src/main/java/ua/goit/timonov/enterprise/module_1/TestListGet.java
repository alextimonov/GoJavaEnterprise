package ua.goit.timonov.enterprise.module_1;

import java.util.List;

/**
 * Created by Alex on 26.05.2016.
 */
public class TestListGet extends TestList {
    public <T> TestListGet(List<T> collection, int nElements) {
        super(collection, nElements);
    }

    @Override
    protected void makeOperation(int index, int value) {
        collection.get(index);
    }
}
