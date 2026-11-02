import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

public class frsum {
  static void bf(List<Integer> nums, int target) {
    HashSet<List<Integer>> ans = new HashSet<>();
    for (int i = 0; i < nums.size(); i++) {
      for (int j = i + 1; j < nums.size(); j++) {
        for (int j2 = j + 1; j2 < nums.size(); j2++) {
          for (int k = j2 + 1; k < nums.size(); k++) {
            if (nums.get(i) + nums.get(j) + nums.get(j2) + nums.get(k) == target) {
              List<Integer> temp = new ArrayList<Integer>();
              temp.add(nums.get(i));
              temp.add(nums.get(j));
              temp.add(nums.get(j2));
              temp.add(nums.get(k));
              temp.sort((a, b) -> a.compareTo(b));
              ans.add(temp);
            }
          }
        }
      }
    }
    for (List<Integer> list : ans) {
      System.out.println(list + "\n");
    }
  }

  /**
   * @param args
   */
  public static void main(String[] args) {
    int nums[] = {1, 2, -1, 2, -1, 3, 4};
    List<Integer> l;
    try {
      l = new ArrayList(Arrays.asList(nums));
    } catch (Exception e) {
      System.out.println(e.getStackTrace());
    }
    bf(l, 12);
  }
}
