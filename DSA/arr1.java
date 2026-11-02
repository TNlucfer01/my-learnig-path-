import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class arr1 {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();
    List<Integer> a = new ArrayList<>();
    for (int i = 0; i < n; i++) {
      a.add(sc.nextInt()); // gettung a array intput from the user and adding to th array while the
      // input is seperated by space or line it works for both of the type of input }
      int ans = 0;
      Collections.sort(a);
      while (!a.isEmpty()) {
        if (!a.get(0).equals(a.size() - 1)) {
          a.remove(a.size() - 1);
          if (!a.isEmpty()) a.remove(0);
        } else {
          a.remove(0);
        }
        ans += 1;
      }
      System.out.println(ans);
      sc.close();
    }
  }
}
