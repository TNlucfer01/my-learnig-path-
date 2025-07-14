import java.util.Scanner;
import java.util.Arrays;

public class New {

    Scanner scan=new Scanner(System.in);
    int n = scan.nextInt();
    
    
    public static void main(String[] args) {
        int[] arr = {5, 3, 8, 2};
        Arrays.sort(arr); // Predefined TimSort algorithm
        System.out.println(Arrays.toString(arr));
        Arrays.sort(null, 0, 0, null);
    }
}
 
    

