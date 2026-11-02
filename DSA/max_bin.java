import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class max_bin {

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    List<Integer> res = new ArrayList<>();
    int n = sc.nextInt();
    for (int i = 0; i < n; i++) {
      String a = sc.next();
      String b = sc.next();
      int sum =
          Integer.parseInt(a, 2)
              + Integer.parseInt(
                  b, 2); // getting the input from the string and converting the binry to decimal
      res.add(sum);
    }
    int max = Collections.max(res); // there is a lot function that can be used

    System.out.println(
        Integer.toBinaryString(
            max)); // to conver the integer to something else we can us rh Integer object classs
  }
}
