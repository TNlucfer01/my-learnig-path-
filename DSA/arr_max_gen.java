import java.util.Scanner;

public class arr_max_gen {

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int a = sc.nextInt();
    int[] n = new int[a + 1];
    n[0] = 0;
    n[1] = 1;
    for (int i = 0;
        i < (a) / 2;
        i++) { // the reason is that the array are growing exponentially and this is int division
               // that i happening here not anything else
      n[2 * i] = n[i];
      n[2 * i + 1] = n[i] + n[i + 1];
    }
    int max = n[0];
    for (int i : n) {
      if (i > max) {
        max = i;
      }
      System.out.println(i);
    }

    System.out.println("the max valueis " + max);
  }
}
