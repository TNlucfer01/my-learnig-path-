public class cschar {
  public static void main(String[] args) {
    String word = "AbBCab";
    boolean[][] A = new boolean[2][27];

    for (int i = 0; i < word.length(); i++) {
      char ch = word.charAt(i);
      int idx = ch & 31;
      int Case = (ch >> 5) & 1;

      A[Case][idx] = Case == 0 || !A[0][idx];
      for (int ii = 0; i < 2; i++) {
        for (int j = 1; j < 27; j++) {
          System.out.print(A[ii][j] + " ");
        }
        System.out.println("loop" + ii);
      }

      System.out.println(A[Case][idx] + " te answer" + !A[0][idx]);
    }

    int res = 0;
    for (int i = 1; i < 27; i++) if (A[0][i] && A[1][i]) res++;
    //
    //   int c = 0;
    //   int map[] = new int[26];
    //   char words[] = word.toCharArray();
    //   int left = 0;
    //   int right = 0;
    //
    //   for (int i = 0; i < words.length; i++) {
    //     if (Character.isLowerCase(words[i])) {
    //       map[(int) words[i] - 97] = 1;
    //     }
    //     if (Character.isUpperCase(words[i]) && map[(int) Character.toLowerCase(words[i]) - 97] ==
    // 1) {
    //       c += 1;
    //     }
    //     System.out.println(words[i] & 31);
    //     char ch = words[i];
    //   }
    //   System.out.println(c);
    // }
  }
}
