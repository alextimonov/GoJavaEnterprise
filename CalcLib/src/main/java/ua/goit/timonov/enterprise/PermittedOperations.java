package ua.goit.timonov.enterprise;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Class with map of permitted operation to execute
 */
public class PermittedOperations {
    public static final String PLUS = "+";
    public static final String MINUS = "-";
    protected Map<Operation, String> operations = new HashMap<>();


    /**
     * returns set of strings of permitted math operations
     * @return
     */
    public Set<String> getSetOperations() {
        return operations.values().stream().collect(Collectors.toSet());
    }

    /**
     * Constructor with permitted math operations
     */
    public PermittedOperations() {
        operations.put(new OperationIntegerPlus(), PLUS);
        operations.put(new OperationIntegerMinus(), MINUS);
        operations.put(new OperationLongPlus(), PLUS);
        operations.put(new OperationLongMinus(), MINUS);
        operations.put(new OperationFloatPlus(), PLUS);
        operations.put(new OperationFloatMinus(), MINUS);
        operations.put(new OperationDoublePlus(), PLUS);
        operations.put(new OperationDoubleMinus(), MINUS);
    }


    /**
     * adds new operation to base map
     * @param operation     type of operation to execute
     * @param notation      string with operation's notation
     */
    public void addOperation(Operation operation, String notation) {
        operations.put(operation, notation);
    }

}
