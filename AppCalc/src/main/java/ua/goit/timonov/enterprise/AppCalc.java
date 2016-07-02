
package ua.goit.timonov.enterprise;

/**
 * Calc application
 *
 */
public class AppCalc {
    private InputOutput inputOutput;

    public static void main(String[] args) {
        new AppCalc().execute();
    }

    public void execute() {
        inputOutput = new InputOutput();

        PermittedOperations permittedOperations = new PermittedOperationsForApp();
        Calc calc = new CalcNumbers(permittedOperations);
        String input = inputOutput.inputStringFromConsole();
        String result = calc.doCalc(input);
        inputOutput.printToConsole(input, result);
    }
}
