
// Another package
package acces_modeifier ;


import acces_modeifier.Parent;
class Child extends Parent { //means i can acces the data throufh the inhertance
    public void show() {
        System.out.println(protectedNumber);  // Accessible
        display();                            // Accessible
    }
}

public class protecte {
    public static void main(String[] args) {
        Child child = new Child();
        child.show();

        // Parent parent = new Parent();
        // parent.protectedNumber;  // Not accessible directly
    }
}
