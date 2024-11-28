package thi;

    class Student {
    String name;

    Student setName(String name) {
        this.name = name; // Assign value
        return this;      // Return the current object
    }

    void display() {
        System.out.println("Name: " + this.name);
    }
}

public class thi3 {
    public static void main(String[] args) {
        Student s1 = new Student();
        s1.setName("Aathi").display(); // Method chaining
        // Output: Name: Aathi
    }
}

    
