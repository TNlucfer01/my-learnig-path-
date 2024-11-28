package acces_modeifier;
class PrivateExample {
    private String name = "Aathi";
///info hiding
    private void display() {
        System.out.println("Private method called");
    }

    public String getName() {  // Getter method
        return name;
    }

    public void setName(String name) {  // Setter method
        this.name = name;
    }
}

public class privat {
    public static void main(String[] args) {
        PrivateExample obj = new PrivateExample();
        // obj.name;  // Not accessible
        // obj.display();  // Not accessible
        
        System.out.println(obj.getName());  // Accessible through getter
        obj.setName("Lucy");
        System.out.println(obj.getName());
    }
}
