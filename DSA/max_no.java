import java.util.Scanner;

public class max_no {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    String n = sc.nextLine();
    char d = sc.next().charAt(0); // to read the single character only
    int max = Integer.MIN_VALUE;

    for (int i = 0; i < n.length(); i++) {
      if (n.charAt(i) == d) {
        String temp = n.substring(0, i) + n.substring(i + 1, n.length()); // string scling i n java
        int cur = Integer.parseInt(temp);
        if (cur > max) {
          max = cur;
        }
      }
    }
    System.out.println(max);
    System.out.println(String.valueOf(max)); // coverting to the string
  }
}
