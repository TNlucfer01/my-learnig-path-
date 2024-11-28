package thi;

    class Student {
    String name;
    int age;

    // Constructor 1
    Student(String name) {
        this(name, 18); // Calls Constructor 2
    }

    // Constructor 2
    Student(String name, int age) {
        this.name = name;
        this.age = age;
    }

    void display() {
        System.out.println("Name: " + this.name + ", Age: " + this.age);
    }
}

public class this1 {
           public int add(int a ,int b ){
            return a+b;
        } 
        public int a =10;
    public static void main(String[] args) {
        Student s1 = new Student("Aathi");
        s1.display(); // Output: Name: Aathi, Age: 18
        System.out.println("Sum: " + new this1().add(10, 20));
    }
}

class aathi{
    
}

    

