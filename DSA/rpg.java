import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;

public class rpg {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();
    int exp = sc.nextInt();
    int[] p = new int[n], b = new int[n];
    for (int i = 0; i < n; i++) {
      p[i] = sc.nextInt();
    }
    for (int i = 0; i < n; i++) {
      b[i] = sc.nextInt();
    }
    List<int[]> arr = new ArrayList<>();
    for (int i = 0; i < n; i++) { // achviing the same level of bundling in the java
      arr.add(new int[] {p[i], b[i]});
    }
    arr.sort(
        Comparator.comparingInt(
            x -> x[0])); // for comparingInt but what does that means can i use this anywhere
    int ans = 0;
    for (int[] var : arr) {
      int power = var[0];
      int bonus = var[1];
      if (exp < power) {
        break;
      }
      exp += bonus;
      ans++;
    }
    System.out.println(ans);
  }
}
