public class arr {

  public static void main(String[] args) {
    int[] arr = {7, 8, 5, 5, 9, 2, 2, 0, 1, 6};

    int n = arr.length;
    arraycyce(n, arr);
  }

  public static void arraycyce(int n, int[] arr) {
    int max_value = Integer.MIN_VALUE;

    int[] res = new int[n]; // new type of array createion in java with init to 0
    for (int start = 0; start < n; start++) {
      // genrated succusfully
      for (int j = 0; j < arr.length; j++) {
        res[j] = arr[(start - j + n) % n];
      }
      int ans = 0, total = 0;
      for (int i : res) {
        ans ^= i; // xor operator in java dnmany other programming langage too
        total += ans;
      }
      if (max_value < total) max_value = total;
    }
    for (int start = 0; start < n; start++) {
      // genrated succusfully
      for (int j = 0;
          j < arr.length;
          j++) { // converting the list into a cycle list bby just the way we acces is great
        res[j] = arr[(start + j) % n];
      }
      int ans = 0, total = 0;
      for (int i : res) {
        ans ^= i;
        total += ans;
      }
      if (max_value < total) max_value = total;
    }

    System.out.println(max_value);
  }
}
