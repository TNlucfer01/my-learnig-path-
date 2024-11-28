package thi;

class Calculator {
    void add(int a, int b) {
        System.out.println("Sum: " + (a + b));
    }

    void performAddition() {
        this.add(5, 10); // Calls the 'add' method
    }
}

public class this2{
    public static void main(String[] args) {
        Calculator calc = new Calculator();
        calc.performAddition(); // Output: Sum: 15
    }
}
