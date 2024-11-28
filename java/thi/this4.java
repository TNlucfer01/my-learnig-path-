package thi;

    class Printer {
    void printDetails(Student student) {
        System.out.println("Printing details: " + student.name);
    }
}

class Student {
    String name;

    Student(String name) {
        this.name = name;
    }

    void display(Printer printer) {
        printer.printDetails(this); // Passes the current object
    }
}

public class this4 {
    public static void main(String[] args) {
        Student s1 = new Student("Aathi");
        Printer printer = new Printer();
        s1.display(printer); // Output: Printing details: Aathi
    }
}

    

