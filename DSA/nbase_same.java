import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;

public class nbase_same {

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int m = sc.nextInt();
    int min_base = 3;
    while (min_base < m) {
      boolean ans = all_digits_same(m, min_base);
      if (ans) {
        break;
      }
      min_base += 1;
    }
    System.out.println(min_base);
  }

  static boolean all_digits_same(int m, int b) {
    List<Integer> digits = new ArrayList<>();

    int temp = m;
    while (temp > 0) {
      digits.add(temp % b);
      temp = Math.floorDiv(temp, b);
    }
    HashSet<Integer> digitSet =
        new HashSet<>(
            digits); // we could conver one collection to another as long they are having thesae
                     // inheritance
    return (digitSet.size() == 1);
  }
}
