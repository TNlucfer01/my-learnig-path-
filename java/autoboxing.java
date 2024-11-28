import java.util.*;
public class autoboxing {
   
   public static void main(String[] args) {
    char a = 'A';
    Character b = 'B';
    System.out.println(a);
    System.out.println(b);
    ArrayList <Character> list = new ArrayList<Character>();
    list.add('C');
    list.add('D');
    Integer obj = 10; // Autoboxing
int num = obj;    // Unboxing

    System.out.println(list);
    
   } 
}
