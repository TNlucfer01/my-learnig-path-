package thi;
class Student {
    String name;

    // Constructor with a parameter having the same name as the instance variable
    Student(String name) {
        this.name = name; // 'this.name' refers to the instance variable
    }

    void display() {
        System.out.println("Name: " + this.name);
    }
}
public class thiS {



    public static void main(String[] args) {
        Student s1 = new Student("Aathi");
        s1.display(); // Output: Name: Aathi
    }


    
}
